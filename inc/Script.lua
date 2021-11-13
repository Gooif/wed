
local inspect = (loadfile "./libs/inspect.lua")()
local function iBoss(msg,MsgText)
if msg.forward_info_ then return false end

if MsgText[1] == "/start commands" and msg.type == "pv" then
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
text = [[*• أهلًا بك عزيزي في اوامر البوت
 
 Dev 🎖 -* []]..SUDO_USER..[[]



]]
local inline = {{{text="م1",callback_data="/HelpList1"..msg.sender_user_id_},{text="م2",callback_data="/HelpList2"..msg.sender_user_id_}},{{text="م3",callback_data="/HelpList3"..msg.sender_user_id_}},{{text="الاغاني",callback_data="/HelpListDev"..msg.sender_user_id_},{text="التسليه",callback_data="/HelpListRrd"..msg.sender_user_id_}}} 
return send_inline(msg.chat_id_,text,inline,msg.id_)
end

if msg.Director 
and (redis:get(boss..":Witting_changeamr:"..msg.chat_id_..msg.sender_user_id_) 
or redis:get(boss..":Witting_changeamr2:"..msg.chat_id_..msg.sender_user_id_) 
or redis:get(boss..":Witting_AmrDel:"..msg.chat_id_..msg.sender_user_id_) 
or redis:get(boss..":firstAmrOld:"..msg.chat_id_..msg.sender_user_id_)) and MsgText[1] ~= "الغاء" then 
return false end 

if msg.type ~= 'pv' then if MsgText[1] == "تفعيل" and not MsgText[2] then
return modadd(msg)  
end

if MsgText[1] == "تعطيل" and not MsgText[2] then
if not msg.SudoUser then return '*•* أنـت مو الـمـطـور 'end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..'group:add'..msg.chat_id_) then return sendMsg(msg.chat_id_,msg.id_,'• المجموعه معطله من قبل يالطيب! ') end  
rem_data_group(msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,'• من「 '..NameUser..' 」 \n• ابشر تم التعطيل \n')
end,{msg=msg})
end

end 



if msg.type ~= 'pv' and msg.GroupActive then 



if MsgText[1] == "مسح رسايلي" or MsgText[1] == "مسح رسائلي" or MsgText[1] == "حذف رسائلي" then
	GetUserID(msg.sender_user_id_,function(arg,data)
		local NameUser   = Hyper_Link_Name(data)
		local msgs = redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0
		local del = redis:del(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_)
		if del == 1 then
			message = "ابشر مسحت ( *"..msgs.."* ) من رسائلك"
		else
			message = "ماعندك رسائل"
		end
		sendMsg(msg.chat_id_,msg.id_,message)
	end)
end
if msg.text == "مسح جهاتي" then
	GetUserID(msg.sender_user_id_,function(arg,data)
		local NameUser   = Hyper_Link_Name(data)
		local contacts = redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0
		local del = redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_)
		if del == 1 then
			message = "ابشر مسحت ( *"..contacts.."* ) من جهاتك"
		else
			message = "ماعندك جهات"
		end
		sendMsg(msg.chat_id_,msg.id_,message)
	end)
end


--====================={ start of tf3el }===================

if MsgText[1] == "تعطيل التسليه" and not MsgText[2] then
return cmdss_on(msg)  
end
if MsgText[1] == "تفعيل التسليه" and not MsgText[2] then
return cmdss_off(msg) 
end

function cmdss_on(msg)
if not msg.Admin then return "*•*هذا الامر يخص ( الادمن,المدير,المنشئ,المطور ) بس  \n "
end
redis:set(boss..'lock:karaa:'..msg.chat_id_,'on')
return "*•* اهلًا عزيزي "..msg.TheRankCmd.."\n*•* ابشر عطلت التسليه \n "
end
function cmdss_off(msg)
if not msg.Admin then return "*•*هذا الامر يخص ( الادمن,المدير,المنشئ,المطور ) بس  \n "
end
redis:set(boss..'lock:karaa:'..msg.chat_id_,'off')
return "*•* اهلًا عزيزي "..msg.TheRankCmd.."\n*•* ابشر فعلت التسليه\n "
end


--====================={ end of tf3el }===================

--====================={ start of rf3 }===================



--======={ زق }==========

if MsgText[1] == "رفع زق" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Rank then end
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
USERNAME = Flter_Markdown(msg.UserName)
local NameUser = Hyper_Link_Name(data)
local cmd = "Z"
UserID = data.id_
MsgID = msg.MsgID
ChatID = msg.ChatID
if cmd == "Z" then
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفعني! \n ") 
elseif data.type_.ID == "UserTypeBot" then
return sendMsg(ChatID,MsgID,"*•*مايمديك ترفع بوت! \n ") 
elseif data.type_.ID == "ChannelChatInfo" then 
end
if redis:sismember(boss..':ZZ:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• زق من قبل \n ',17,USERCAR) 
end
redis:sadd(boss..':ZZ:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• رفعته صار زق \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "رفع زق" and msg.reply_id then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
--sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="Z"})
end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
return false
end


if MsgText[1] == "تنزيل زق" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Rank then end
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
local USERNAME = Flter_Markdown(msg.UserName)
local NameUser   = Hyper_Link_Name(data)
local cmd = "ZZZ"
local UserID = data.id_
local MsgID = msg.MsgID
local ChatID = msg.ChatID
if cmd == "ZZZ" then
if not redis:sismember(boss..':ZZ:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• مو زق من قبل \n ',17,USERCAR) 
end
redis:srem(boss..':ZZ:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」\n• نزلته من قائمة الزق \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "تنزيل زق" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ZZZ"})
end
return false
end


--======={ كيك }==========


if MsgText[1] == "رفع كيكه" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
USERNAME = Flter_Markdown(msg.UserName)
local NameUser = Hyper_Link_Name(data)
local cmd = "k"
UserID = data.id_
MsgID = msg.MsgID
ChatID = msg.ChatID
if cmd == "k" then
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفعني! \n ") 
elseif data.type_.ID == "UserTypeBot" then
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفع بوت! \n ") 
elseif data.type_.ID == "ChannelChatInfo" then 
end
if redis:sismember(boss..':kk:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• كيكه من قبل \n ',17,USERCAR) 
end
redis:sadd(boss..':kk:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• رفعته صار كيكه \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "رفع كيكه" and msg.reply_id then
if not MsgText[2] and msg.reply_id then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
--sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="k"})
end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
return false
end


if MsgText[1] == "تنزيل كيكه" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Rank then end
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
local USERNAME = Flter_Markdown(msg.UserName)
local NameUser   = Hyper_Link_Name(data)
local cmd = "kkk"
local UserID = data.id_
local MsgID = msg.MsgID
local ChatID = msg.ChatID
if cmd == "kkk" then
if not redis:sismember(boss..':kk:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• مو كيكه من قبل \n ',17,USERCAR) 
end
redis:srem(boss..':kk:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」\n• نزلته من قائمة الكيك \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "تنزيل كيكه" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kkk"})
end
return false
end


--======={ حمار }==========


if MsgText[1] == "رفع حمار" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
USERNAME = Flter_Markdown(msg.UserName)
local NameUser = Hyper_Link_Name(data)
local cmd = "h"
UserID = data.id_
MsgID = msg.MsgID
ChatID = msg.ChatID
if cmd == "h" then
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفعني! \n ") 
elseif data.type_.ID == "UserTypeBot" then
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفع بوت! \n ") 
elseif data.type_.ID == "ChannelChatInfo" then 
end
if redis:sismember(boss..':hh:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• حمار من قبل \n ',17,USERCAR) 
end
redis:sadd(boss..':hh:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• رفعته صار حمار \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "رفع حمار" and msg.reply_id then
if not MsgText[2] and msg.reply_id then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
--sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="h"})
end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
return false
end


if MsgText[1] == "تنزيل حمار" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Rank then end
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
local USERNAME = Flter_Markdown(msg.UserName)
local NameUser   = Hyper_Link_Name(data)
local cmd = "hhh"
local UserID = data.id_
local MsgID = msg.MsgID
local ChatID = msg.ChatID
if cmd == "hhh" then
if not redis:sismember(boss..':hh:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• مو حمار من قبل \n ',17,USERCAR) 
end
redis:srem(boss..':hh:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」\n• نزلته من قائمة الحمير \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "تنزيل حمار" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="hhh"})
end
return false
end



--======={ عسل }==========


if MsgText[1] == "رفع عسل" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
USERNAME = Flter_Markdown(msg.UserName)
local NameUser = Hyper_Link_Name(data)
local cmd = "q"
UserID = data.id_
MsgID = msg.MsgID
ChatID = msg.ChatID
if cmd == "q" then
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفعني! \n ") 
elseif data.type_.ID == "UserTypeBot" then
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفع بوت! \n ") 
elseif data.type_.ID == "ChannelChatInfo" then 
end
if redis:sismember(boss..':qq:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• عسل من قبل \n ',17,USERCAR) 
end
redis:sadd(boss..':qq:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• رفعته صار عسل \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "رفع عسل" and msg.reply_id then
if not MsgText[2] and msg.reply_id then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
--sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="q"})
end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
return false
end


if MsgText[1] == "تنزيل عسل" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Rank then end
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
local USERNAME = Flter_Markdown(msg.UserName)
local NameUser   = Hyper_Link_Name(data)
local cmd = "qqq"
local UserID = data.id_
local MsgID = msg.MsgID
local ChatID = msg.ChatID
if cmd == "qqq" then
if not redis:sismember(boss..':qq:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• مو عسل من قبل \n ',17,USERCAR) 
end
redis:srem(boss..':qq:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」\n• نزلته من قائمة العسل \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "تنزيل عسل" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="qqq"})
end
return false
end



--======={ بقره }==========

if MsgText[1] == "رفع بقره" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
USERNAME = Flter_Markdown(msg.UserName)
local NameUser = Hyper_Link_Name(data)
local cmd = "b"
UserID = data.id_
MsgID = msg.MsgID
ChatID = msg.ChatID
if cmd == "b" then
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفعني! \n ") 
elseif data.type_.ID == "UserTypeBot" then
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفع بوت! \n ") 
elseif data.type_.ID == "ChannelChatInfo" then 
end
if redis:sismember(boss..':bb:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• بقره من قبل \n ',17,USERCAR) 
end
redis:sadd(boss..':bb:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• رفعته صار بقره \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "رفع بقره" and msg.reply_id then
if not MsgText[2] and msg.reply_id then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
--sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="b"})
end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
return false
end


if MsgText[1] == "تنزيل بقره" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Rank then end
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
local USERNAME = Flter_Markdown(msg.UserName)
local NameUser   = Hyper_Link_Name(data)
local cmd = "bbb"
local UserID = data.id_
local MsgID = msg.MsgID
local ChatID = msg.ChatID
if cmd == "bbb" then
if not redis:sismember(boss..':bb:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• مو بقره من قبل \n ',17,USERCAR) 
end
redis:srem(boss..':bb:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」\n• نزلته من قائمة البقر \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "تنزيل بقره" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="bbb"})
end
return false
end

--======={ كلب }==========

if MsgText[1] == "رفع كلب" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
USERNAME = Flter_Markdown(msg.UserName)
local NameUser = Hyper_Link_Name(data)
local cmd = "l"
UserID = data.id_
MsgID = msg.MsgID
ChatID = msg.ChatID
if cmd == "l" then
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفعني! \n ") 
elseif data.type_.ID == "UserTypeBot" then
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفع بوت! \n ") 
elseif data.type_.ID == "ChannelChatInfo" then 
end
if redis:sismember(boss..':ll:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• كلب من قبل \n ',17,USERCAR) 
end
redis:sadd(boss..':ll:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• رفعته صار كلب \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "رفع كلب" and msg.reply_id then
if not MsgText[2] and msg.reply_id then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
--sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="l"})
end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
return false
end


if MsgText[1] == "تنزيل كلب" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Rank then end
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
local USERNAME = Flter_Markdown(msg.UserName)
local NameUser   = Hyper_Link_Name(data)
local cmd = "lll"
local UserID = data.id_
local MsgID = msg.MsgID
local ChatID = msg.ChatID
if cmd == "lll" then
if not redis:sismember(boss..':ll:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• مو كلب من قبل \n ',17,USERCAR) 
end
redis:srem(boss..':ll:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」\n• نزلته من قائمة الكلاب \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "تنزيل كلب" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="lll"})
end
return false
end


--======={ قرد }==========


if MsgText[1] == "رفع قرد" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
USERNAME = Flter_Markdown(msg.UserName)
local NameUser = Hyper_Link_Name(data)
local cmd = "g"
UserID = data.id_
MsgID = msg.MsgID
ChatID = msg.ChatID
if cmd == "g" then
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفعني! \n ") 
elseif data.type_.ID == "UserTypeBot" then
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفع بوت! \n ") 
elseif data.type_.ID == "ChannelChatInfo" then 
end
if redis:sismember(boss..':gg:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• قرد من قبل \n ',17,USERCAR) 
end
redis:sadd(boss..':gg:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• رفعته صار قرد \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "رفع قرد" and msg.reply_id then
if not MsgText[2] and msg.reply_id then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
--sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="g"})
end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
return false
end


if MsgText[1] == "تنزيل قرد" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Rank then end
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
local USERNAME = Flter_Markdown(msg.UserName)
local NameUser   = Hyper_Link_Name(data)
local cmd = "ggg"
local UserID = data.id_
local MsgID = msg.MsgID
local ChatID = msg.ChatID
if cmd == "ggg" then
if not redis:sismember(boss..':gg:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• مو قرد من قبل \n ',17,USERCAR) 
end
redis:srem(boss..':gg:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」\n• نزلته من قائمة القرود \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "تنزيل قرد" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ggg"})
end
return false
end


--======={ تيس }==========


if MsgText[1] == "رفع تيس" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
USERNAME = Flter_Markdown(msg.UserName)
local NameUser = Hyper_Link_Name(data)
local cmd = "t"
UserID = data.id_
MsgID = msg.MsgID
ChatID = msg.ChatID
if cmd == "t" then
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفعني! \n ") 
elseif data.type_.ID == "UserTypeBot" then
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفع بوت! \n ") 
elseif data.type_.ID == "ChannelChatInfo" then 
end
if redis:sismember(boss..':tt:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• تيس من قبل \n ',17,USERCAR) 
end
redis:sadd(boss..':tt:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• رفعته صار تيس \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "رفع تيس" and msg.reply_id then
if not MsgText[2] and msg.reply_id then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
--sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="t"})
end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
return false
end


if MsgText[1] == "تنزيل تيس" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Rank then end
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
local USERNAME = Flter_Markdown(msg.UserName)
local NameUser   = Hyper_Link_Name(data)
local cmd = "ttt"
local UserID = data.id_
local MsgID = msg.MsgID
local ChatID = msg.ChatID
if cmd == "ttt" then
if not redis:sismember(boss..':tt:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• مو تيس من قبل \n ',17,USERCAR) 
end
redis:srem(boss..':tt:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」\n• نزلته من قائمة التيوس \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "تنزيل تيس" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ttt"})
end
return false
end


--======={ ثور }==========


if MsgText[1] == "رفع ثور" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
USERNAME = Flter_Markdown(msg.UserName)
local NameUser = Hyper_Link_Name(data)
local cmd = "f"
UserID = data.id_
MsgID = msg.MsgID
ChatID = msg.ChatID
if cmd == "f" then
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفعني! \n ") 
elseif data.type_.ID == "UserTypeBot" then
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفع بوت! \n ") 
elseif data.type_.ID == "ChannelChatInfo" then 
end
if redis:sismember(boss..':ff:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• ثور من قبل \n ',17,USERCAR) 
end
redis:sadd(boss..':ff:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• رفعته صار ثور \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "رفع ثور" and msg.reply_id then
if not MsgText[2] and msg.reply_id then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
--sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="f"})
end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
return false
end


if MsgText[1] == "تنزيل ثور" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Rank then end
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
local USERNAME = Flter_Markdown(msg.UserName)
local NameUser   = Hyper_Link_Name(data)
local cmd = "fff"
local UserID = data.id_
local MsgID = msg.MsgID
local ChatID = msg.ChatID
if cmd == "fff" then
if not redis:sismember(boss..':ff:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• مو ثور من قبل \n ',17,USERCAR) 
end
redis:srem(boss..':ff:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」\n• نزلته من قائمة الثيران \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "تنزيل ثور" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="fff"})
end
return false
end


--======={ باعوص }==========

if MsgText[1] == "رفع باعوص" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
USERNAME = Flter_Markdown(msg.UserName)
local NameUser = Hyper_Link_Name(data)
local cmd = "c"
UserID = data.id_
MsgID = msg.MsgID
ChatID = msg.ChatID
if cmd == "c" then
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفعني! \n ") 
elseif data.type_.ID == "UserTypeBot" then
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفع بوت! \n ") 
elseif data.type_.ID == "ChannelChatInfo" then 
end
if redis:sismember(boss..':cc:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• باعوص من قبل \n ',17,USERCAR) 
end
redis:sadd(boss..':cc:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• رفعته صار باعوص \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "رفع باعوص" and msg.reply_id then
if not MsgText[2] and msg.reply_id then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
--sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="c"})
end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
return false
end


if MsgText[1] == "تنزيل باعوص" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Rank then end
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
local USERNAME = Flter_Markdown(msg.UserName)
local NameUser   = Hyper_Link_Name(data)
local cmd = "ccc"
local UserID = data.id_
local MsgID = msg.MsgID
local ChatID = msg.ChatID
if cmd == "ccc" then
if not redis:sismember(boss..':cc:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• مو باعوص من قبل \n ',17,USERCAR) 
end
redis:srem(boss..':cc:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」\n• نزلته من قائمة البواعيص \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "تنزيل باعوص" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ccc"})
end
return false
end



--======={ دجاجه }==========

if MsgText[1] == "رفع دجاجه" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
USERNAME = Flter_Markdown(msg.UserName)
local NameUser = Hyper_Link_Name(data)
local cmd = "d"
UserID = data.id_
MsgID = msg.MsgID
ChatID = msg.ChatID
if cmd == "d" then
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفعني! \n ") 
elseif data.type_.ID == "UserTypeBot" then
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفع بوت! \n ") 
elseif data.type_.ID == "ChannelChatInfo" then 
end
if redis:sismember(boss..':dd:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• دجاجه من قبل \n ',17,USERCAR) 
end
redis:sadd(boss..':dd:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• رفعته صار دجاجه \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "رفع دجاجه" and msg.reply_id then
if not MsgText[2] and msg.reply_id then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
--sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="d"})
end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
return false
end


if MsgText[1] == "تنزيل دجاجه" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Rank then end
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
local USERNAME = Flter_Markdown(msg.UserName)
local NameUser   = Hyper_Link_Name(data)
local cmd = "ddd"
local UserID = data.id_
local MsgID = msg.MsgID
local ChatID = msg.ChatID
if cmd == "ddd" then
if not redis:sismember(boss..':dd:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• مو دجاجه من قبل \n ',17,USERCAR) 
end
redis:srem(boss..':dd:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」\n• نزلته من قائمة الدجاج \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "تنزيل دجاجه" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ddd"})
end
return false
end


--======={ هطف }==========


if MsgText[1] == "رفع هطف" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
USERNAME = Flter_Markdown(msg.UserName)
local NameUser = Hyper_Link_Name(data)
local cmd = "a"
UserID = data.id_
MsgID = msg.MsgID
ChatID = msg.ChatID
if cmd == "a" then
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفعني! \n ") 
elseif data.type_.ID == "UserTypeBot" then
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفع بوت! \n ") 
elseif data.type_.ID == "ChannelChatInfo" then 
end
if redis:sismember(boss..':aa:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• هطف من قبل \n ',17,USERCAR) 
end
redis:sadd(boss..':aa:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• رفعته صار هطف \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "رفع هطف" and msg.reply_id then
if not MsgText[2] and msg.reply_id then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
--sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="a"})
end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
return false
end


if MsgText[1] == "تنزيل هطف" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Rank then end
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
local USERNAME = Flter_Markdown(msg.UserName)
local NameUser   = Hyper_Link_Name(data)
local cmd = "aaa"
local UserID = data.id_
local MsgID = msg.MsgID
local ChatID = msg.ChatID
if cmd == "aaa" then
if not redis:sismember(boss..':aa:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• مو هطف من قبل \n ',17,USERCAR) 
end
redis:srem(boss..':aa:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」\n• نزلته من قائمة الهطوف \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end

if MsgText[1] == "تنزيل هطف" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="aaa"})
end
return false
end


--======={ صياد }==========

if MsgText[1] == "رفع صياد" or MsgText[1] == "رفع صياده" then
if  MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
USERNAME = Flter_Markdown(msg.UserName)
local NameUser = Hyper_Link_Name(data)
local cmd = "m"
UserID = data.id_
MsgID = msg.MsgID
ChatID = msg.ChatID
if cmd == "m" then
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفعني! \n ") 
elseif data.type_.ID == "UserTypeBot" then
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفع بوت! \n ") 
elseif data.type_.ID == "ChannelChatInfo" then 
end
if redis:sismember(boss..':mm:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• صياد من قبل \n ',17,USERCAR) 
end
redis:sadd(boss..':mm:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• رفعته صار صياد \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end
end

if MsgText[1] == "رفع صياد" or MsgText[1] == "رفع صياده" then
if msg.reply_id then
if not MsgText[2] and msg.reply_id then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
--sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="m"})
end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
return false
end
end

if MsgText[1] == "تنزيل صياد" or MsgText[1] == "تنزيل صياده" then  
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Rank then end
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
local USERNAME = Flter_Markdown(msg.UserName)
local NameUser   = Hyper_Link_Name(data)
local cmd = "mmm"
local UserID = data.id_
local MsgID = msg.MsgID
local ChatID = msg.ChatID
if cmd == "mmm" then
if not redis:sismember(boss..':mm:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• مو صياد من قبل \n ',17,USERCAR) 
end
redis:srem(boss..':mm:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」\n• نزلته من قائمة الصيادين \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end
end

if MsgText[1] == "تنزيل صياد" or MsgText[1] == "تنزيل صياده" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="mmm"})
end
return false
end


--======={ خاروف }==========


if MsgText[1] == "رفع خاروف" or MsgText[1] == "رفع خاروفه" then
if  MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
USERNAME = Flter_Markdown(msg.UserName)
local NameUser = Hyper_Link_Name(data)
local cmd = "r"
UserID = data.id_
MsgID = msg.MsgID
ChatID = msg.ChatID
if cmd == "r" then
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفعني! \n ") 
elseif data.type_.ID == "UserTypeBot" then
return sendMsg(ChatID,MsgID,"*•* مايمديك ترفع بوت! \n ") 
elseif data.type_.ID == "ChannelChatInfo" then 
end
if redis:sismember(boss..':rr:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• خاروف من قبل \n ',17,USERCAR) 
end
redis:sadd(boss..':rr:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• رفعته صار خاروف \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end
end

if MsgText[1] == "رفع خاروف" or MsgText[1] == "رفع خاروفه" then
if msg.reply_id then
if not MsgText[2] and msg.reply_id then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
--sendMsg(msg.chat_id_,msg.id_,"*•* أهلا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="r"})
end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
return false
end
end

if MsgText[1] == "تنزيل خاروف" or MsgText[1] == "تنزيل خاروفه" then  
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Rank then end
if MsgText[2]:match('@[%a%d_]+') then
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'off' then
GetUserName(MsgText[2],function(msg,data)
local USERNAME = Flter_Markdown(msg.UserName)
local NameUser   = Hyper_Link_Name(data)
local cmd = "rrr"
local UserID = data.id_
local MsgID = msg.MsgID
local ChatID = msg.ChatID
if cmd == "rrr" then
if not redis:sismember(boss..':rr:'..ChatID,UserID) then 
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」 \n• مو خاروف من قبل \n ',17,USERCAR) 
end
redis:srem(boss..':rr:'..ChatID,UserID)
return SendMention(ChatID,UserID,MsgID,'• العضو 「 '..NameUser..' 」\n• نزلته من قائمة الخرفان \n ',17,USERCAR) 
end


end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})


end
end
if redis:get(boss..'lock:karaa:'..msg.chat_id_) == 'on' then  
sendMsg(msg.chat_id_,msg.id_,"*•* اهلًا عزيزي "..msg.TheRank.."\n*•* اوامر التسليه معطله\n ")
end
end
end

if MsgText[1] == "تنزيل خاروف" or MsgText[1] == "تنزيل خاروفه" then
if not msg.Rank then end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="rrr"})
end
return false
end

--====================={ end of rf3 }======================



--====================={ start of list }===================

--======={ زق }==========

if MsgText[1] == "قائمة الزق" or MsgText[1] == "قائمة الزقان" then 
if not msg.Rank then end
return ZZZZ(msg) 
end


if MsgText[2] == "قائمة الزق" or MsgText[2] == "قائمة الزقان" then
if not msg.Rank then end
local NumMnsha = redis:scard(boss..':ZZ:'..msg.chat_id_)
if NumMnsha ==0 then 
return "*•* مافيه احد مرفوع في البوت عشان امسحه \n!" 
end
redis:del(boss..':ZZ:'..msg.chat_id_)
return "*•*أهلا عيني "..msg.TheRankCmd.."   \n• مسحت ( * "..NumMnsha.." * ) من الزق \n "
end


--======={ كيك }==========

if MsgText[1] == "قائمة الكيك" or MsgText[1] == "قائمة الكيكات" then 
if not msg.Rank then end
return kkkk(msg) 
end


if MsgText[2] == "قائمة الكيك" or MsgText[2] == "قائمة الكيكات" then
if not msg.Rank then end
local NumMnsha = redis:scard(boss..':kk:'..msg.chat_id_)
if NumMnsha ==0 then 
return "*•* مافيه احد مرفوع في البوت عشان امسحه \n!" 
end
redis:del(boss..':kk:'..msg.chat_id_)
return "*•*أهلا عيني "..msg.TheRankCmd.."   \n• مسحت ( * "..NumMnsha.." * ) من الكيك \n "
end


--======={ حمار }==========

if MsgText[1] == "قائمة الحمار" or MsgText[1] == "قائمة الحمير" then 
if not msg.Rank then end
return hhhh(msg) 
end


if MsgText[2] == "قائمة الحمار" or MsgText[2] == "قائمة الحمير" then
if not msg.Rank then end
local NumMnsha = redis:scard(boss..':hh:'..msg.chat_id_)
if NumMnsha ==0 then 
return "*•* مافيه احد مرفوع في البوت عشان امسحه \n!" 
end
redis:del(boss..':hh:'..msg.chat_id_)
return "*•*أهلا عيني "..msg.TheRankCmd.."   \n• مسحت ( * "..NumMnsha.." * ) من الحمير \n "
end


--======={ عسل }==========

if MsgText[1] == "قائمة العسل" then 
if not msg.Rank then end
return qqqq(msg) 
end


if MsgText[2] == "قائمة العسل" then
if not msg.Rank then end
local NumMnsha = redis:scard(boss..':qq:'..msg.chat_id_)
if NumMnsha ==0 then 
return "*•* مافيه احد مرفوع في البوت عشان امسحه \n!" 
end
redis:del(boss..':qq:'..msg.chat_id_)
return "*•*أهلا عيني "..msg.TheRankCmd.."   \n• مسحت ( * "..NumMnsha.." * ) من العسل \n "
end


--======={ بقره }==========

if MsgText[1] == "قائمة البقر" then 
if not msg.Rank then end
return bbbb(msg) 
end


if MsgText[2] == "قائمة البقر" then
if not msg.Rank then end
local NumMnsha = redis:scard(boss..':bb:'..msg.chat_id_)
if NumMnsha ==0 then 
return "*•* مافيه احد مرفوع في البوت عشان امسحه \n!" 
end
redis:del(boss..':bb:'..msg.chat_id_)
return "*•*أهلا عيني "..msg.TheRankCmd.."   \n• مسحت ( * "..NumMnsha.." * ) من البقر \n "
end


--======={ كلب }==========


if MsgText[1] == "قائمة الكلاب" or MsgText[1] == "قائمة الكلب" then 
if not msg.Rank then end
return llll(msg) 
end


if MsgText[2] == "قائمة الكلاب" or MsgText[2] == "قائمة الكلب" then
if not msg.Rank then end
local NumMnsha = redis:scard(boss..':ll:'..msg.chat_id_)
if NumMnsha ==0 then 
return "*•* مافيه احد مرفوع في البوت عشان امسحه \n!" 
end
redis:del(boss..':ll:'..msg.chat_id_)
return "*•*أهلا عيني "..msg.TheRankCmd.."   \n• مسحت ( * "..NumMnsha.." * ) من الكلاب \n "
end



--======={ قرد }==========

if MsgText[1] == "قائمة القرود" or MsgText[1] == "قائمة القرد" then 
if not msg.Rank then end
return gggg(msg) 
end


if MsgText[2] == "قائمة القرود" or MsgText[1] == "قائمة القرد" then
if not msg.Rank then end
local NumMnsha = redis:scard(boss..':gg:'..msg.chat_id_)
if NumMnsha ==0 then 
return "*•* مافيه احد مرفوع في البوت عشان امسحه \n!" 
end
redis:del(boss..':gg:'..msg.chat_id_)
return "*•*أهلا عيني "..msg.TheRankCmd.."   \n• مسحت ( * "..NumMnsha.." * ) من القرود \n "
end


--======={ تيس }==========

if MsgText[1] == "قائمة التيس" or MsgText[1] == "قائمة التيوس" then 
if not msg.Rank then end
return tttt(msg) 
end


if MsgText[2] == "قائمة التيس" or MsgText[2] == "قائمة التيوس" then
if not msg.Rank then end
local NumMnsha = redis:scard(boss..':tt:'..msg.chat_id_)
if NumMnsha ==0 then 
return "*•* مافيه احد مرفوع في البوت عشان امسحه \n!" 
end
redis:del(boss..':tt:'..msg.chat_id_)
return "*•*أهلا عيني "..msg.TheRankCmd.."   \n• مسحت ( * "..NumMnsha.." * ) من التيوس \n "
end


--======={ ثور }==========


if MsgText[1] == "قائمة الثور" or MsgText[1] == "قائمة الثيران" then 
if not msg.Rank then end
return ffff(msg) 
end


if MsgText[2] == "قائمة الثور" or MsgText[2] == "قائمة الثيران" then
if not msg.Rank then end
local NumMnsha = redis:scard(boss..':ff:'..msg.chat_id_)
if NumMnsha ==0 then 
return "*•* مافيه احد مرفوع في البوت عشان امسحه \n!" 
end
redis:del(boss..':ff:'..msg.chat_id_)
return "*•*أهلا عيني "..msg.TheRankCmd.."   \n• مسحت ( * "..NumMnsha.." * ) من الثيران \n "
end


--======={ باعوص }==========

if MsgText[1] == "قائمة البواعيص" or MsgText[1] == "قائمة الباعوص" then 
if not msg.Rank then end
return cccc(msg) 
end


if MsgText[2] == "قائمة البواعيص" or MsgText[2] == "قائمة الباعوص" then
if not msg.Rank then end
local NumMnsha = redis:scard(boss..':cc:'..msg.chat_id_)
if NumMnsha ==0 then 
return "*•* مافيه احد مرفوع في البوت عشان امسحه \n!" 
end
redis:del(boss..':cc:'..msg.chat_id_)
return "*•*أهلا عيني "..msg.TheRankCmd.."   \n• مسحت ( * "..NumMnsha.." * ) من الثيران \n "
end


--======={ دجاجه }==========

if MsgText[1] == "قائمة الدجاج" then 
if not msg.Rank then end
return dddd(msg) 
end


if MsgText[2] == "قائمة الدجاج" then
if not msg.Rank then end
local NumMnsha = redis:scard(boss..':dd:'..msg.chat_id_)
if NumMnsha ==0 then 
return "*•* مافيه احد مرفوع في البوت عشان امسحه \n!" 
end
redis:del(boss..':dd:'..msg.chat_id_)
return "*•*أهلا عيني "..msg.TheRankCmd.."   \n• مسحت ( * "..NumMnsha.." * ) من الدجاج \n "
end


--======={ هطف }==========


if MsgText[1] == "قائمة الهطوف" then 
if not msg.Rank then end
return aaaa(msg) 
end


if MsgText[2] == "قائمة الهطوف" then
if not msg.Rank then end
local NumMnsha = redis:scard(boss..':aa:'..msg.chat_id_)
if NumMnsha ==0 then 
return "*•* مافيه احد مرفوع في البوت عشان امسحه \n!" 
end
redis:del(boss..':aa:'..msg.chat_id_)
return "*•*أهلا عيني "..msg.TheRankCmd.."   \n• مسحت ( * "..NumMnsha.." * ) من الهطوف \n "
end


--======={ صياد }==========


if MsgText[1] == "قائمة الصيادين" then 
if not msg.Rank then end
return mmmm(msg) 
end


if MsgText[2] == "قائمة الصيادين" then
if not msg.Rank then end
local NumMnsha = redis:scard(boss..':mm:'..msg.chat_id_)
if NumMnsha ==0 then 
return "*•* مافيه احد مرفوع في البوت عشان امسحه \n!" 
end
redis:del(boss..':mm:'..msg.chat_id_)
return "*•*أهلا عيني "..msg.TheRankCmd.."   \n• مسحت ( * "..NumMnsha.." * ) من الصيادين \n "
end


--======={ خاروف }==========

if MsgText[1] == "قائمة الخرفان" or MsgText[1] == "قائمة الخاروف" then 
if not msg.Rank then end
return rrrr(msg) 
end


if MsgText[2] == "قائمة الخرفان" or MsgText[1] == "قائمة الخاروف" then
if not msg.Rank then end
local NumMnsha = redis:scard(boss..':rr:'..msg.chat_id_)
if NumMnsha ==0 then 
return "*•* مافيه احد مرفوع في البوت عشان امسحه \n!" 
end
redis:del(boss..':rr:'..msg.chat_id_)
return "*•*أهلا عيني "..msg.TheRankCmd.."   \n• مسحت ( * "..NumMnsha.." * ) من الخرفان \n "
end


--====================={ end of list }===================



if msg.text == "مسح قائمة التثبيت" and msg.Admin then
GetUserID(msg.sender_user_id_,function(arg,data)
--print(inspect (arg))
local req = https.request(ApiToken.."/unpinAllChatMessages?chat_id="..msg.chat_id_)
local NameUser   = Hyper_Link_Name(data)
sendMsg(msg.chat_id_,msg.id_,"• ابشر مسحت قائمة التثبيت   \n• من「 "..NameUser.." 」 \n ") 
end)
end


if MsgText[1] == "تفعيل البايو" and msg.Admin then
sendMsg(msg.chat_id_,msg.id_,"تم تفعيل البايو")
redis:set(boss..':bio:'..msg.chat_id_,"yes")
end
if MsgText[1] == "تعطيل البايو" and msg.Admin then
sendMsg(msg.chat_id_,msg.id_,"تم تعطيل البايو")
redis:set(boss..':bio:'..msg.chat_id_,"no")
end


if MsgText[1] == "بايو" and msg.reply_id == nil and redis:get(boss..':bio:'..msg.chat_id_) == "yes" then 
local url , res = https.request(ApiToken..'/getChat?chat_id='..msg.sender_user_id_)
if res == 200 then
local jsonn = JSON.decode(url)
bio = jsonn.result.bio or 'ماعندك بايو'
else
bio = 'ماعندك بايو'
end
sendMsg(msg.chat_id_,msg.id_,'`'..bio..'`')
end

if MsgText[1] == "بايو" and msg.reply_id and redis:get(boss..':bio:'..msg.chat_id_) == "yes" then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
local url , res = https.request(ApiToken..'/getChat?chat_id='..data.sender_user_id_)
if res == 200 then
local jsonn = JSON.decode(url)
bio = jsonn.result.bio or'ماعنده بايو'
else
bio = 'ماعنده بايو'
end
sendMsg(data.chat_id_,msg.id_,'`'..bio..'`')
end)
end




if MsgText[1] == "ايدي" or MsgText[1]:lower() == "id" then
if not MsgText[2] and not msg.reply_id then
if redis:get(boss..'lock_id'..msg.chat_id_) then

GetUserID(msg.sender_user_id_,function(arg,data)

local msgs = redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if data.username_ then UserNameID = "🎫 ↧مـعرفك ↞ [ @"..data.username_.." ] \n" else UserNameID = "" end
if data.username_ then UserNameID1 = "@"..data.username_ else UserNameID1 = "مافيه" end
if data.last_name_ then Name = data.first_name_ .." "..data.last_name_ else Name = data.first_name_ end
local url , res = https.request(ApiToken..'/getChat?chat_id='..msg.sender_user_id_)
if res == 200 then
local jsonn = JSON.decode(url)
bio = jsonn.result.bio
if jsonn.result.bio ~= nil then 
bio = '<code>'..bio..'</code>'
else
bio = 'لايوجد'
end
end
word = {'📸 ↧ دز','بس بس يكفي حلاوه','📸 ↧ اذا مو احلى ايدي','📸 ↧ جبر ياخي','📸 ↧ الله!','📸 ↧ عمري الحلوين','📸 ↧ ايدي قلبي',}
words = word[math.random(#word)]
local Namei = FlterName(data,99)
if data.status_.ID == "UserStatusEmpty" then
sendMsg(arg.chat_id_,arg.id_,'• مايمديني اطلع افتارك لانك حاظرني!\n\n')
else
GetPhotoUser(data.id_,function(arg,data)
local edited = (redis:get(boss..':edited:'..arg.chat_id_..':'..arg.sender_user_id_) or 0)
local points = redis:get(boss..':User_Points:'..arg.chat_id_..arg.sender_user_id_) or 0
local KleshaID = '' 
..' '..words..' \n'
..'🎟 ↧ايديــك ↞ '..arg.sender_user_id_..' \n'
..arg.UserNameID
..'🔫 ↧رتبتـــك ↞ '..arg.TheRank..' \n'
..'🧨 ↧تفاعـلك ↞ '..Get_Ttl(arg.msgs)..'\n'
..'💬 ↧رسائلك ↞ '..arg.msgs..' \n'
..'💡 ↧تكليجاتك ↞ '..edited..' \n'
..'💎 ↧مجوهراتك ↞ '..points..' \n'
..' '..bio..' \n'
local Kleshaidinfo = redis:get(boss..":infoiduser_public:"..arg.chat_id_) or redis:get(boss..":infoiduser")  
if Kleshaidinfo then 
local points = redis:get(boss..':User_Points:'..arg.chat_id_..arg.sender_user_id_) or 0
KleshaID = Kleshaidinfo:gsub("{الاسم}",arg.Namei)
KleshaID = KleshaID:gsub("{الايدي}",arg.sender_user_id_)
KleshaID = KleshaID:gsub("{المعرف}",arg.UserNameID1)
KleshaID = KleshaID:gsub("{الرتبه}",arg.TheRank)
KleshaID = KleshaID:gsub("{التفاعل}",Get_Ttl(arg.msgs))
KleshaID = KleshaID:gsub("{الرسائل}",arg.msgs)
KleshaID = KleshaID:gsub("{التعديل}",edited)
KleshaID = KleshaID:gsub("{المجوهرات}",points)
KleshaID = KleshaID:gsub("{البوت}",redis:get(boss..':NameBot:'))
KleshaID = KleshaID:gsub("{المطور}",SUDO_USER)
KleshaID = KleshaID:gsub("{بايو}",bio)
KleshaID = KleshaID:gsub("{البايو}",bio)
end
if redis:get(boss.."idphoto"..msg.chat_id_) then
if data.photos_ and data.photos_[0] then 
KleshaID = KleshaID:gsub("{تعليق}",words)
local req = https.request(ApiToken..'/sendPhoto?chat_id='..arg.chat_id_..'&reply_to_message_id='..tonumber(arg.id_/2097152/0.5)..'&photo='..data.photos_[0].sizes_[1].photo_.persistent_id_..'&parse_mode=html&caption='..URL.escape(KleshaID))
else
KleshaID = KleshaID:gsub("{تعليق}",'مافيه')
local req = https.request(ApiToken..'/sendMessage?chat_id='..arg.chat_id_..'&reply_to_message_id='..tonumber(arg.id_/2097152/0.5)..'&parse_mode=html&text='..URL.escape("• ماحطيت افتار ... !\n\n"..KleshaID))
--sendMsg(arg.chat_id_,arg.id_,'• ماحطيت افتار ... !\n\n'..KleshaID..bio)
end
else
KleshaID = KleshaID:gsub("{تعليق}",'مافيه')
local req = https.request(ApiToken..'/sendMessage?chat_id='..arg.chat_id_..'&reply_to_message_id='..tonumber(arg.id_/2097152/0.5)..'&parse_mode=html&text='..URL.escape(KleshaID))
--sendMsg(arg.chat_id_,arg.id_,KleshaID)
end

end,{chat_id_=arg.chat_id_,id_=arg.id_,TheRank=arg.TheRank,sender_user_id_=data.id_,msgs=msgs,Namei=Namei,UserNameID=UserNameID,UserNameID1=UserNameID1})


end

end,{chat_id_=msg.chat_id_,id_=msg.id_,TheRank=msg.TheRank})

end
end




if msg.reply_id and not MsgText[2] then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* معليش هذا العضو مو موجود من ضمن المحموعات \n") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data)
USERNAME = USERNAME:gsub([[\_]],"_")
USERCAR = utf8.len(USERNAME) 
SendMention(arg.ChatID,arg.UserID,arg.MsgID,"الايدي ⇠ ( "..arg.UserID.." )",37,USERCAR)
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافي عضو بهذا اليوزر \n") end 
local UserID = data.id_
UserName = Flter_Markdown(arg.UserName)
sendMsg(arg.ChatID,arg.MsgID,"** الايدي ⇠ ( `"..UserID.."` )")
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 
return false
end


if MsgText[1] == "تعديلاتي" or MsgText[1] == "تكليجاتي" then    
local numvv = redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0
return "*• تكليجاتك:* "..numvv
end




if MsgText[1] == "تغير الرتبه" or MsgText[1] == "تغيير الرتبه" or MsgText[1] == "تغيير رتبه" or MsgText[1] == "تغير رتبه" then
if not msg.SuperCreator  then return "• هذا الامر يخص ( المالك الاساسي,المطور ) بس  \n" end
redis:setex(boss..":Witing_NewRtba:"..msg.chat_id_..msg.sender_user_id_,1000,true)
redis:del(boss..":Witting_NewRtba2:"..msg.chat_id_..msg.sender_user_id_)
return "• ارسل الرتبه اللي تبي تغييرها \n\n• مالك اساسي \n• مالك \n• مدير \n• ادمن \n• مميز \n "
end


if MsgText[1] == "مسح الرتبه" or MsgText[1] == "مسح رتبه" then
if not msg.SuperCreator  then return "*• هذا الامر يخص ( المالك الاساسي,المطور ) بس*  \n" end
redis:setex(boss..":Witing_DelNewRtba:"..msg.chat_id_..msg.sender_user_id_,1000,true)
return "• ارسل الرتبه اللي تبي تحذفها \n\n• مالك اساسي \n• مالك \n• مدير \n• ادمن \n• مميز \n "
end
if MsgText[1] == "مسح قائمه الرتب" or MsgText[1] == "مسح قائمة الرتب" or MsgText[1] == "مسح الرتب" then
if not msg.SudoUser then return "• هذا الامر يخص ( المطور ) بس  \n" end
redis:del(boss..":RtbaNew1:"..msg.chat_id_)
redis:del(boss..":RtbaNew2:"..msg.chat_id_)
redis:del(boss..":RtbaNew3:"..msg.chat_id_)
redis:del(boss..":RtbaNew4:"..msg.chat_id_)
redis:del(boss..":RtbaNew5:"..msg.chat_id_)
redis:del(boss..":RtbaNew6:"..msg.chat_id_)
redis:del(boss..":RtbaNew7:"..msg.chat_id_)
return "• ابشر مسحتها"
end

if MsgText[1] == "قائمه الرتب" or MsgText[1] == "قائمة الرتب" then
if not msg.SuperCreator  then return "• هذا الامر يخص ( المالك الاساسي,المطور ) بس  \n" end

local Rtba1 = redis:get(boss..":RtbaNew1:"..msg.chat_id_) or " مافيه "
local Rtba2 = redis:get(boss..":RtbaNew2:"..msg.chat_id_) or " مافيه "
local Rtba3 = redis:get(boss..":RtbaNew3:"..msg.chat_id_) or " مافيه "
local Rtba4 = redis:get(boss..":RtbaNew4:"..msg.chat_id_) or " مافيه "
local Rtba5 = redis:get(boss..":RtbaNew5:"..msg.chat_id_) or " مافيه "
local Rtba6 = redis:get(boss..":RtbaNew6:"..msg.chat_id_) or " مافيه "
local Rtba7 = redis:get(boss..":RtbaNew7:"..msg.chat_id_) or " مافيه "

return "• قائمة الرتب الجديده : \n\n• مطور اساسي ⇠ ["..Rtba1.."]\n• مالك اساسي  ⇠ ["..Rtba3.."]\n• مطور  ⇠ ["..Rtba2.."]\n• مالك  ⇠ ["..Rtba4.."]\n• مدير  ⇠ ["..Rtba5.."]\n• ادمن  ⇠ ["..Rtba6.."]\n• مميز  ⇠ ["..Rtba7.."]\n"
end



if MsgText[1] == "المالك"  or MsgText[1] == "مالك" or  MsgText[1] == "المنشى" then

message = ""
local monsha = redis:smembers(boss..':MONSHA_Group:'..msg.chat_id_)
if #monsha == 0 then 
message = message .."• مافيه مالك !\n"
else
for k,v in pairs(monsha) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
GetUserName(info.username,function(arg,data)

uuuu = arg.UserName:gsub("@","")
sendMsg(arg.ChatID,arg.MsgID,"["..data.title_.."](t.me/"..uuuu..")")
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=info.username})
else
message = message..' ['..info.username..'](t.me/reecbot)  \n'
sendMsg(msg.chat_id_,msg.id_,message)
end

break

end
end

end


if MsgText[1] == "المجموعه" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
GetFullChat(msg.chat_id_,function(arg,data)
local GroupName = (redis:get(boss..'group:name'..arg.ChatID) or '')
redis:set(boss..'linkGroup'..arg.ChatID,(data.invite_link_ or ""))
sendMsg(arg.ChatID,arg.MsgID,
"•  ❪ مـعـلومـات الـمـجـموعـه ❫ \n\n"
.."*•* عدد الاعـضـاء  ❪ *"..data.member_count_.."* ❫ "
.."\n*•* عدد المحظـوريـن  ❪ *"..data.kicked_count_.."* ❫ "
.."\n*•* عدد الادمـنـيـه  ❪ *"..data.administrator_count_.."* ❫ "
.."\n*•* الايــدي  ❪ `"..arg.ChatID.."` ❫ "
.."\n\n ❪  ["..FlterName(GroupName).."]("..(data.invite_link_ or "")..")  ❫ \n"
)
end,{ChatID=msg.chat_id_,MsgID=msg.id_}) 
return false
end



if MsgText[1] == "تثبيت" and msg.reply_id then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
local GroupID = msg.chat_id_:gsub('-100','')
if not msg.Director and redis:get(boss..'lock_pin'..msg.chat_id_) then
return "مايمديك تثبت الامر مقفل من الادارة"
else
tdcli_function({
ID="PinChannelMessage",
channel_id_ = GroupID,
message_id_ = msg.reply_id,
disable_notification_ = 1},
function(arg,data)
if data.ID == "Ok" then
redis:set(boss..":MsgIDPin:"..arg.ChatID,arg.reply_id)
sendMsg(arg.ChatID,arg.MsgID,"*•* اهلًا عزيزي "..arg.TheRankCmd.." \n*•* ابشر تم تثبيت الرسالة \n ")
elseif data.ID == "Error" and data.code_ == 6 then
sendMsg(arg.ChatID,arg.MsgID,'*•* معليش مايمديني اثبت .\n*•* مو مشرف او ماعندي صلاحية التثبيت \n ༄')    
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,reply_id=msg.reply_id,TheRankCmd=msg.TheRankCmd})
end
return false
end

if MsgText[1] == "الغاء التثبيت" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
if not msg.Director and redis:get(boss..'lock_pin'..msg.chat_id_) then return "مايمديك تلغي التثبيت الامر مقفل من  الادارة" end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},function(arg,data) 
if data.ID == "Ok" then
sendMsg(arg.ChatID,arg.MsgID,"*•* اهلًا عزيزي "..arg.TheRankCmd.."  \n*•* ابشر تم الغاء تثبيت الرساله \n ")    
elseif data.ID == "Error" and data.code_ == 6 then
sendMsg(arg.ChatID,arg.MsgID,'*•* معليش مايمديني الغي التثبيت .\n*•* مو مشرف او ماعندي صلاحية التثبيت \n ༄')    
elseif data.ID == "Error" and data.code_ == 400 then
sendMsg(arg.ChatID,arg.MsgID,'*•* هييه ركز يا '..arg.TheRankCmd..' .\n*•* مافيه رسالة مثبته! \n ༄')    
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,TheRankCmd=msg.TheRankCmd})
return false
end

if MsgText[1] == "تقييد" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
if not MsgText[2] and msg.reply_id then  -- By Replay 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* معليش هذا العضو مو موجود ضمن المجموعات \n ") end
local UserID = data.sender_user_id_
if UserID == our_id then  
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تقييد البوت!  \n") 
elseif UserID == 811166089 or UserID == 811166089  then  
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تقييد Ace 🎖!\n") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هيييه مايمديك تقييد Dev 🎖 ياورع!\n") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تقييد المطور!\n") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تقييد المالك!\n") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تقييد المالك الاساسي!\n") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تقييد المدير!\n") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تقييد الادمن!\n") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تقييد المميز\n") 
end
GetChatMember(arg.ChatID,UserID,function(arg,data)
if data.status_.ID == "ChatMemberStatusMember" then
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
sendMsg(arg.ChatID,arg.MsgID,"• العضو   「 "..NameUser.." 」 \n• تم تقييده \n ") 
end,{ChatID=arg.ChatID,UserID=arg.UserID,MsgID=arg.MsgID})
Restrict(arg.ChatID,arg.UserID,1)
redis:set(boss..":TqeedUser:"..arg.ChatID..arg.UserID,true)
elseif data.status_.ID == "ChatMemberStatusLeft" then
sendMsg(arg.ChatID,arg.MsgID,"*•* مايمدي تقييده لانه برا المجموعة\n ") 
else
sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديني اقييد المشرف\n ") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then  -- By Username 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافي عضو بهذا اليوزر \n ") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"*•* ركز! هذا معرف قناة مو حساب  \n ") end
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تقييد البوت!\n") 
elseif  UserID == 811166089 or UserID == 811166089  then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تقييد Ace 🎖!\n") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تقييد Dev 🎖 ياورع!\n") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تقييد المطور! \n") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تقييد المالك! \n") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك المالك الاساسي! \n") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تقييد المدير! \n") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تقييد الادمن!\n") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تقييد المميز! \n") 
end
GetChatMember(arg.ChatID,our_id,function(arg,data)
if data.status_.ID == "ChatMemberStatusEditor" then 
GetChatMember(arg.ChatID,arg.UserID,function(arg,data)
if data.status_.ID == "ChatMemberStatusMember" then 
Restrict(arg.ChatID,arg.UserID,1)  
sredis:set(boss..":TqeedUser:"..arg.ChatID..arg.UserID,true)
endMsg(arg.ChatID,arg.MsgID,"• العضو  「 "..NameUser.." 」 \n• تم تقييده \n ") 
else
sendMsg(arg.ChatID,arg.MsgID,'*•* مايمديني اقييده  .\n* لانه مشرف في المجموعه \n ༄ ')    
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserName=arg.UserName,UserID=arg.UserID})
else
sendMsg(arg.ChatID,arg.MsgID,'*•* مايمديني اقييده .\n* لاني مو مشرف بالمجموعة \n ༄ ')    
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserName=arg.UserName,UserID=UserID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]}) 
elseif MsgText[2] and MsgText[2]:match('^%d+$') then  -- By UserID
UserID =  MsgText[2] 
if UserID == our_id then   
return sendMsg(msg.chat_id_,msg.id_,"*•* هييه مايمديك تقييد البوت!\n") 
elseif UserID == "811166089" or UserID == "811166089" then 
return sendMsg(msg.chat_id_,msg.id_,"*•* هييه مايمديك تقييد Ace 🎖! \n") 
elseif UserID == tostring(SUDO_ID) then 
return sendMsg(msg.chat_id_,msg.id_,"*•* هييه مايمديك تقييد Dev 🎖 ياورع!\n") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(msg.chat_id_,msg.id_,"*•* هييه مايمديك تقييد المطور!\n") 
elseif redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
return sendMsg(msg.chat_id_,msg.id_,"*•* هييه مايمديك تقييد المالك!\n") 
elseif redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,UserID) then 
return sendMsg(msg.chat_id_,msg.id_,"*•* هييه مايمديك نقييد المالك الاساسي!\n") 
elseif redis:sismember(boss..'owners:'..msg.chat_id_,UserID) then 
return sendMsg(msg.chat_id_,msg.id_,"*•* هييه مايمديك تقييد المدير!\n") 
elseif redis:sismember(boss..'admins:'..msg.chat_id_,UserID) then 
return sendMsg(msg.chat_id_,msg.id_,"*•* هييه مايمديك تقييد الادمن!\n") 
end
GetUserID(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه حساب بهذا الايدي  \n ") end 
if data.username_ then 
UserName = '@'..data.username_
else 
UserName = FlterName(data.first_name_..' '..(data.last_name_ or ""),20) 
end
NameUser = Hyper_Link_Name(data)
GetChatMember(arg.ChatID,our_id,function(arg,data)
if data.status_.ID ~= "ChatMemberStatusEditor" then 
return sendMsg(arg.ChatID,arg.MsgID,'*•* مايمديني اقييده .\n* لاني مو مشرف بالمجموعة \n ')    
end
Restrict(arg.ChatID,arg.UserID,1)
redis:set(boss..":TqeedUser:"..arg.ChatID..arg.UserID,true)
sendMsg(arg.ChatID,arg.MsgID,"• العضو  「 "..NameUser.." 」 \n• تم تقييده \n  ") 
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserName=UserName,UserID=data.id_})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end 
return false
end

if MsgText[1] == "الغاء التقييد" or MsgText[1] == "الغاء تقييد" or MsgText[1] == "فك تقييد" or MsgText[1] == "فك التقييد" then 
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n ") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تسوي الامر وانت ترد على رسالة البوت! \n") end
Restrict(arg.ChatID,UserID,2)
redis:del(boss..":TqeedUser:"..arg.ChatID..UserID)
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
sendMsg(arg.ChatID,arg.MsgID,"• العضو  「 "..NameUser.." 」 \n• الغيت تقييده \n ") 
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_}) 


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then  -- BY Username
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر \n") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه هذا يوزر قناة مو حساب! \n") end
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
GetChatMember(arg.ChatID,our_id,function(arg,data)
if data.status_.ID ~= "ChatMemberStatusEditor" then 
return sendMsg(arg.ChatID,arg.MsgID,'*•* مايمديني اقييده  .\n•* لاني مو مشرف بالمجموعة\n ')    
end
Restrict(arg.ChatID,arg.UserID,2)  
redis:del(boss..":TqeedUser:"..arg.ChatID..arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"• العضو  「 "..NameUser.." 」 \n• الغيت تقييده \n  ") 
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserID=UserID,NameUser=NameUser})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه حساب بهذا اليوزر  \n ") end 
NameUser = Hyper_Link_Name(data)
if data.id_ == our_id then  
return sendMsg(ChatID,MsgID,"*•* البوت مو مقييد \n ") 
end
GetChatMember(arg.ChatID,our_id,function(arg,data)
if data.status_.ID ~= "ChatMemberStatusEditor" then 
return sendMsg(arg.ChatID,arg.MsgID,'*•* مايمديني الغي تقييده .\n•* لاني مو مشرف \n ')    
end
redis:del(boss..":TqeedUser:"..arg.ChatID..arg.UserID)
Restrict(arg.ChatID,arg.UserID,2)
sendMsg(arg.ChatID,arg.MsgID,"• العضو  「 "..NameUser.." 」 \n• الغيت تقييده \n ") 
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserID=data.id_,NameUser=NameUser})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end 
return false
end

if MsgText[1] == "رفع مميز" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* معليش هذا العضو مو موجود ضمن المجموعات \n ") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تسوي الامر وانت ترد على رسالة البوت! \n") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..'whitelist:'..arg.ChatID,arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"• الحلو 「 "..NameUser.." 」 \n• مميز من قبل \n ") 
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..'whitelist:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"• الحلو 「 "..NameUser.." 」 \n• رفعته صار مميز \n ") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then  --BY USERNAME
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"•*•* مافيه عضو بهذا اليوزر! \n") end 
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديني ارفع البوت! \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then
return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديني ارفع البوت \n") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه هذا يوزر قناة مو حساب! \n") 
end
UserName = arg.UserName
if redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"• الحلو 「 "..NameUser.." 」 \n• مميز من قبل \n ") 
end
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..'whitelist:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"• الحلو 「 "..NameUser.." 」 \n• رفعته صار مميز \n ") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setwhitelist"})
end 
return false
end
if MsgText[1] == "تنزيل مميز" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تسوي الامر وانت ترد على رسالة البوت! \n") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..'whitelist:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• مو مميز من قبل \n ") 
else
redis:srem(boss..'whitelist:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• نزلته من المميز \n ") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
UserName = Flter_Markdown(arg.UserName)
if not redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• مو مميز من قبل \n ")
else
redis:srem(boss..'whitelist:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• نزلته من المميز \n ") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remwhitelist"})
end 
return false
end

if (MsgText[1] == "رفع المدير"  or MsgText[1] == "رفع مدير" ) then
if not msg.Creator then return "• هذا الامر يخص ( المطور,المالك ) بس  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود من ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تسوي الامر وانت ترد على رسالة البوت! \n") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)

if redis:sismember(boss..'owners:'..arg.ChatID,arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"• الحلو 「 "..NameUser.." 」 \n• مدير من قبل \n ")
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..'owners:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"• الحلو 「 "..NameUser.." 」 \n• رفعته صار مدير \n ") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديني ارفع البوت \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديني ارفع البوت \n") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه هذا يوزر قناة مو حساب! \n") 
end
UserName = arg.UserName
if redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"• الحلو 「 "..NameUser.." 」 \n• مدير من قبل \n ")
else
redis:hset(boss..'username:'..UserID, 'username',UserName)
redis:sadd(boss..'owners:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"• الحلو「 "..NameUser.." 」 \n• رفعته صار مدير \n ")
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setowner"})
end 
return false
end

if (MsgText[1] == "تنزيل المدير" or MsgText[1] == "تنزيل مدير" ) then
if not msg.Creator then return "• هذا الامر يخص ( المطور,المالك ) بس  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تسوي الامر وانت ترد على رسالة البوت\n") end
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..'owners:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• مو مدير من قبل \n ") 
else
redis:srem(boss..'owners:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• نزلته من المدير \n ") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر \n") end 
local UserID = data.id_
UserName = Flter_Markdown(arg.UserName)
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"•「 "..NameUser.." 」 \n• مو مدير من قبل \n ")  
else
redis:srem(boss..'owners:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"•「 "..NameUser.." 」 \n• نزلته من المدير \n ") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remowner"}) 
end 
return false
end

if (MsgText[1] == "رفع مالك" or MsgText[1] == "رفع منشئ") then
if not msg.SuperCreator then return "• هذا الامر يخص ( المطور,Dev 🎖 ) بس  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تسوي الامر وانت ترد على رسالة البوت \n") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)

if redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"• الحلو 「 "..NameUser.." 」 \n• مالك من قبل \n ") 
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..':MONSHA_BOT:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"• الحلو 「 "..NameUser.." 」 \n• رفعته صار مالك \n ") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديني ارفع البوت! \n") end 
NameUser = Hyper_Link_Name(data)
local UserID = data.id_
if UserID == our_id then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديني ارفع البوت! \n") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه هذا يوزر قناة مو حساب! \n") 
end
UserName = arg.UserName
if redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"• الحلو 「 "..NameUser.." 」 \n• مالك من قبل \n ") 
else
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..':MONSHA_BOT:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"• الحلو 「 "..NameUser.." 」 \n• رفعته صار مالك \n ") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setmnsha"})
end  
return false
end

if (MsgText[1] == "تنزيل مالك" or MsgText[1] == "تنزيل منشئ" ) then
if not msg.SuperCreator then return "• هذا الامر يخص ( المطور,Dev 🎖 ) بس  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
local MsgID = arg.MsgID
local ChatID = arg.ChatID
if not data.sender_user_id_ then return sendMsg(ChatID,MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تسوي الامر وانت ترد على رسالة البوت \n") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,arg.UserID) then
return sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• مو مالك من قبل \n ") 
else
redis:srem(boss..':MONSHA_BOT:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• نزلته من المالك \n ") 
end
end,{ChatID=ChatID,UserID=UserID,MsgID=MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
UserName = Flter_Markdown(arg.UserName)
if not redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• مو مالك من قبل \n ") 
else
redis:srem(boss..':MONSHA_BOT:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• نزلته من المالك \n ") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remmnsha"})
end 
return false
end

if MsgText[1] == "رفع ادمن" then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تسوي الامر وانت ترد على رسالة البوت \n") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser   = Hyper_Link_Name(data)
if redis:sismember(boss..'admins:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"• الحلو「 "..NameUser.." 」 \n• ادمن من قبل \n ") 
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..'admins:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"• الحلو「 "..NameUser.." 」 \n• رفعته صار ادمن \n ") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})



elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديني ارفع البوت! \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديني ارفع البوت! \n") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه هذا يوزر قناة مو حساب! \n") 
end
UserName = arg.UserName
if redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"• الحلو「 "..NameUser.." 」 \n• ادمن من قبل \n ") 
else
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..'admins:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"• الحلو「 "..NameUser.." 」 \n• رفعته صار ادمن \n ") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="promote"})
end 
return false
end

if MsgText[1] == "تنزيل ادمن" then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تسوي الامر وانت ترد على رسالة البوت \n") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..'admins:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• مو ادمن من قبل \n ") 
else
redis:srem(boss..'admins:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• نزلته من الادمن \n ") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
NameUser = Hyper_Link_Name(data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
UserName = Flter_Markdown(arg.UserName)
if not redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• مو ادمن من قبل \n ") 
else
redis:srem(boss..'admins:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• نزلته من الادمن \n ") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="demote"})
end 
return false
end

if MsgText[1] == "التفاعل" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
local USERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if data.username_ then UserNameID = "@"..data.username_ else UserNameID = "مافيه" end  
local maseegs = redis:get(boss..'msgs:'..arg.UserID..':'..arg.ChatID) or 1
local edited = redis:get(boss..':edited:'..arg.ChatID..':'..arg.UserID) or 0
local content = redis:get(boss..':adduser:'..arg.ChatID..':'..arg.UserID) or 0
sendMsg(arg.ChatID,arg.MsgID,"🎟↧ايديه ↞ `"..arg.UserID.."`\n💬↧رسائله ↞ "..maseegs.."\n🎫↧معرفه ↞ ["..UserNameID.."]\n🧨↧تفاعله ↞ "..Get_Ttl(maseegs).."\n🔫↧رتبته ↞ "..Getrtba(arg.UserID,arg.ChatID).."\n💡️↧تعديلاته ↞ "..edited.."\n📞↧جهاته ↞ "..content.." \n ") 
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
local USERNAME = arg.user
NameUser = Hyper_Link_Name(data)
local maseegs = redis:get(boss..'msgs:'..UserID..':'..arg.ChatID) or 1
local edited = redis:get(boss..':edited:'..arg.ChatID..':'..UserID) or 0
local content = redis:get(boss..':adduser:'..arg.ChatID..':'..UserID) or 0
sendMsg(arg.ChatID,arg.MsgID,"🎟↧ايديه ↞ `"..UserID.."`\n💬↧رسائله ↞ "..maseegs.."\n🎫↧معرفه ↞ ["..USERNAME.."]\n🧨↧تفاعله ↞ "..Get_Ttl(maseegs).."\n🔫↧رتبته ↞ "..Getrtba(UserID,arg.ChatID).."\n💡️↧تعديلاته ↞ "..edited.."\n📞↧جهاته ↞ "..content.." \n ") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_,user=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tfa3l"}) 
end
return false
end

if MsgText[1] == "كشف" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data)
USERCAR = utf8.len(USERNAME)
local namei = data.first_name_..' '..(data.last_name_ or "")
if data.username_ then useri = Flter_Markdown('@'..data.username_) else useri = " مافيه " end
SendMention(arg.ChatID,arg.UserID,arg.MsgID,'• الاسم ↢ '..namei..'\n'
..'• الايدي ↢ '..arg.UserID..' \n'
..'• المعرف ↢ *(* '..useri..' *)*\n'
..'• الرتبه ↢ '..Getrtba(arg.UserID,arg.ChatID)..'\n'
..'• نوع الكشف ↢ بالرد\n ',13,utf8.len(namei))
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
UserName = Flter_Markdown(arg.UserName)
sendMsg(arg.ChatID,arg.MsgID,'*•* الاسم ↢ '..FlterName(data.title_,30)..'\n'..'*•* الايدي ↢ `'..UserID..'` \n'..'*•* المعرف ↢ '..UserName..'\n• الرتبه ↢ '..Getrtba(UserID,arg.ChatID)..'\n*•* نوع الكشف ↢ بالمعرف\n'..'༄')
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="whois"}) 
end
return false
end


if MsgText[1] == "رفع القيود" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تسوي الامر وانت ترد على رسالة البوت \n") end
GetUserID(UserID,function(arg,data)
if msg.SudoBase then redis:srem(boss..'gban_users',arg.UserID)  end 
Restrict(arg.ChatID,arg.UserID,2)
redis:srem(boss..'banned:'..arg.ChatID,arg.UserID)
StatusLeft(arg.ChatID,arg.UserID)
redis:srem(boss..'is_silent_users:'..arg.ChatID,arg.UserID)
NameUser = Hyper_Link_Name(data)
sendMsg(arg.ChatID,arg.MsgID,"• العضو 「 "..NameUser.." 」 \n• رفعت عنه القيود  \n ") 
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تسوي الامر وانت ترد على رسالة البوت \n") end
if msg.SudoBase then redis:srem(boss..'gban_users',UserID)  end 
Restrict(arg.ChatID,UserID,2)
redis:srem(boss..'banned:'..arg.ChatID,UserID)
StatusLeft(arg.ChatID,UserID)
redis:srem(boss..'is_silent_users:'..arg.ChatID,UserID)
NameUser = Hyper_Link_Name(data)
sendMsg(arg.ChatID,arg.MsgID,"• العضو 「 "..NameUser.." 」 \n• رفعت عنه القيود  \n ") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
if msg.SudoBase then redis:srem(boss..'gban_users',MsgText[2])  end 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="rfaqud"}) 
end 
return false
end
if MsgText[1] == "طرد" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
if not msg.Creator and not redis:get(boss.."lock_KickBan"..msg.chat_id_) then return "*•* الامر معطل من الادارة  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تطرد البوت! \n") 
elseif UserID == 811166089 or UserID == 811166089 then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تطرد Ace 🎖! \n") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تطرد Dev 🎖 ياورع! \n") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تطرد المطور! \n") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تطرد المالك! \n") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تطرد المالك الاساسي! \n") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تطرد المدير! \n") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تطرد الادمن! \n") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•*هييه مايمديك تطرد المميز! \n") 
end
kick_user(UserID,arg.ChatID,function(arg,data)
if data.ID == "Error" and data.code_ == 400 then
return sendMsg(arg.ChatID,arg.MsgID,'*•* مايمديني احظره .\n*•* لانه مشرف \n ')    
elseif data.ID == "Error" and data.code_ == 3 then
return sendMsg(arg.ChatID,arg.MsgID,'*•* مايمديني احظره .\n*•* ماعندي صلاحية الحظر او مو مشرف\n ')    
end
GetUserID(arg.UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
sendMsg(arg.ChatID,arg.MsgID,"• العضو 「 "..NameUser.." 」 \n• طردته \n ") 
StatusLeft(arg.ChatID,arg.UserID)
end,{ChatID=arg.ChatID,UserID=arg.UserID,MsgID=arg.MsgID})
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
UserName = arg.UserName
NameUser = Hyper_Link_Name(data)
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تطرد البوت! \n") 
elseif UserID == 811166089 or UserID == 811166089 then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تطرد Ace 🎖! \n") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تطرد Dev 🎖 ياورع! \n") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تطرد المطور! \n") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تطرد المالك! \n") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تطرد المالك الاساسي! \n") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تطرد المدير! \n") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تطرد الادمن! \n") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تطرد المميز! \n") 
end
kick_user(UserID,arg.ChatID,function(arg,data)
if data.ID == "Error" and data.code_ == 400 then
return sendMsg(arg.ChatID,arg.MsgID,'*•* مايمديني اطرده .\n*•* لان عنده اشراف \n ')    
elseif data.ID == "Error" and data.code_ == 3 then
return sendMsg(arg.ChatID,arg.MsgID,'*•* مايمديني اطرده .\n*•* ماعندي صلاحية الحظر او مو مشرف \n ')    
end
StatusLeft(arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"• العضو 「 "..arg.NameUser.." 」 \n• طردته \n ") 
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserName=UserName,UserID=UserID,NameUser=NameUser})
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="kick"}) 
end 
return false
end


if MsgText[1] == "حظر" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
if not msg.Creator and not redis:get(boss.."lock_KickBan"..msg.chat_id_) then return "*•* الامر معطل من الادارة  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n ") end
local UserID = data.sender_user_id_

if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر البوت! \n") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر Dev 🎖 ياورع! \n") 
elseif UserID == 811166089 or UserID == 811166089 then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر Ace 🎖! \n") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر المطور! \n") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر المالك! \n") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر المالك الاساسي! \n") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر المدير! \n") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر الادمن! \n") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر المميز! \n") 
end

kick_user(UserID,arg.ChatID,function(arg,data)
if data.ID == "Error" and data.code_ == 400 then
return sendMsg(arg.ChatID,arg.MsgID,'*•* مايمديني احظره .\n*•* لان عنده اشراف \n ')    
elseif data.ID == "Error" and data.code_ == 3 then
return sendMsg(arg.ChatID,arg.MsgID,'*•* مايمديني احظره .\n*•* ماعندي صلاحية الحظر او مو مشرف\n ')    
else
GetUserID(arg.UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
USERNAME = ResolveUserName(data)
if redis:sismember(boss..'banned:'..arg.ChatID,arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"• العضو 「 "..NameUser.." 」 \n• محظور من قبل \n ") 
end

redis:hset(boss..'username:'..arg.UserID,'username',USERNAME)
redis:sadd(boss..'banned:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"• العضو 「 "..NameUser.." 」 \n• حظرته \n ") 
end,{ChatID=arg.ChatID,UserID=arg.UserID,MsgID=arg.MsgID})
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})



elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)

if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر البوت! \n") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر Dev 🎖 ياورع! \n") 
elseif UserID == 811166089 or UserID == 811166089 then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر Ace 🎖! \n") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر المطور! \n") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر المالك! \n") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر المالك الاساسي! \n") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر المدير! \n") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تحظر الادمن! \n") 
end
if data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه هذا يوزر قناة مو حساب! \n") 
end
if redis:sismember(boss..'banned:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"• العضو 「 "..NameUser.." 」 \n• محظور من قبل \n ") 
end
kick_user(UserID,arg.ChatID,function(arg,data)
if data.ID == "Error" and data.code_ == 400 then
return sendMsg(arg.ChatID,arg.MsgID,'*•* مايمديني احظره .\n*•* لان عنده اشراف \n ')    
elseif data.ID == "Error" and data.code_ == 3 then
return sendMsg(arg.ChatID,arg.MsgID,'*•* مايمديني احظره .\n*•* ماعندي صلاحية الحظر او مو مشرف\n ')    
end
redis:hset(boss..'username:'..arg.UserID, 'username',arg.UserName)
redis:sadd(boss..'banned:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"• العضو 「 "..NameUser.." 」 \n• حظرته \n ") 
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserName=UserName,UserID=UserID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ban"}) 
end 
return false
end

--==============================================================================================================================
--==============================================================================================================================
--==============================================================================================================================


if MsgText[1] == "رفع مشرف" then
if not msg.SuperCreator then return "• هذا الامر يخص ( المالك اساسي,المطور ) بس  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_

GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
USERNAME = ResolveUserName(data)
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه هذا يوزر قناة مو حساب! \n") end
redis:hset(boss..'username:'..arg.UserID,'username',USERNAME)
redis:setex(boss..":uploadingsomeon:"..msg.chat_id_..msg.sender_user_id_,500,NameUser)
redis:setex(boss..":uploadingsomeon2:"..msg.chat_id_..msg.sender_user_id_,500,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"• تمام الحين ارسل صلاحيات المشرف \n\n1 ⇠ صلاحيه تغيير المعلومات\n2 ⇠ صلاحيه حذف الرسائل\n3 ⇠ صلاحيه دعوه مستخدمين\n4 ⇠ صلاحيه حظر وتقيد المستخدمين \n5 ⇠ صلاحيه تثبيت الرسائل \n6 • صلاحيه رفع مشرفين اخرين\n\n[*] ⇠ لرفع كل الصلاحيات ما عدا رفع المشرفين \n[**] ⇠ لرفع كل الصلاحيات مع رفع المشرفين \n\n• يمديك تختار الارقام مع بعض وتعيين لقب للمشرف في سطر واحد  \n\nمثال: 136 الهطف \n ") 

end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})



elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه هذا يوزر قناة مو حساب! \n") end
redis:hset(boss..'username:'..UserID,'username',arg.USERNAME)
redis:setex(boss..":uploadingsomeon:"..arg.ChatID..msg.sender_user_id_,500,NameUser)
redis:setex(boss..":uploadingsomeon2:"..arg.ChatID..msg.sender_user_id_,500,UserID)
sendMsg(arg.ChatID,arg.MsgID,"• تمام الحين ارسل صلاحيات المشرف \n\n1 ⇠ صلاحيه تغيير المعلومات\n2 ⇠ صلاحيه حذف الرسائل\n3 ⇠ صلاحيه دعوه مستخدمين\n4 ⇠ صلاحيه حظر وتقيد المستخدمين \n5 ⇠ صلاحيه تثبيت الرسائل \n6 ⇠ صلاحيه رفع مشرفين اخرين\n\n[*] ⇠ لرفع كل الصلاحيات ما عدا رفع المشرفين \n[**] ⇠ لرفع كل الصلاحيات مع رفع المشرفين \n\n• يمديك تختار الارقام مع بعض وتعيين لقب للمشرف في سطر واحد  \n\nمثال: 136 الهطف \n  ") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_,USERNAME=MsgText[2]})

elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="upMshrf"}) 
end 
return false
end

if MsgText[1] == "تنزيل مشرف" then
if not msg.SuperCreator then return "• هذا الامر يخص ( المالك اساسي,المطور ) بس  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمدي تسوي الامر بالبوت \n") end
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه هذا يوزر قناة مو حساب! \n") end
ResAdmin = UploadAdmin(arg.ChatID,arg.UserID,"")  
if ResAdmin == '{"ok":false,"error_code":400,"description":"Bad Request: CHAT_ADMIN_REQUIRED"}' then return sendMsg(arg.ChatID,arg.MsgID,"*•*مايمديني انزله لانه مرفوع من مالك ثاني \n")  end
redis:srem(boss..':MONSHA_BOT:'..arg.ChatID,arg.UserID)
redis:srem(boss..'owners:'..arg.ChatID,arg.UserID)
redis:srem(boss..'admins:'..arg.ChatID,arg.UserID)
redis:srem(boss..'whitelist:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• نزلته من مشرفين المجموعة \n ") 
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمدي تسوي الامر بالبوت \n") end
NameUser = Hyper_Link_Name(data)
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه هذا يوزر قناة مو حساب! \n") end
local ResAdmin = UploadAdmin(arg.ChatID,UserID,"")  
if ResAdmin == '{"ok":false,"error_code":400,"description":"Bad Request: CHAT_ADMIN_REQUIRED"}' then return sendMsg(arg.ChatID,arg.MsgID,"*•*مايمديني انزله لانه مرفوع من مالك ثاني \n")  end
redis:srem(boss..':MONSHA_BOT:'..arg.ChatID,UserID)
redis:srem(boss..'owners:'..arg.ChatID,UserID)
redis:srem(boss..'admins:'..arg.ChatID,UserID)
redis:srem(boss..'whitelist:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• نزلته من مشرفين المجموعة \n ") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="DwonMshrf"}) 
end 
return false
end
--==============================================================================================================================
--==============================================================================================================================
--==============================================================================================================================

if (MsgText[1] == "الغاء الحظر" or MsgText[1] == "الغاء حظر") and msg.Admin then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمدي تسوي الامر بالبوت  \n") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)

GetChatMember(arg.ChatID,arg.UserID,function(arg,data)
if (data.status_.ID == "ChatMemberStatusKicked" or redis:sismember(boss..'banned:'..arg.ChatID,arg.UserID)) then
StatusLeft(arg.ChatID,arg.UserID,function(arg,data) 
if data.message_ and data.message_ == "CHAT_ADMIN_REQUIRED" then 
sendMsg(arg.ChatID,arg.MsgID,"*•* ماعندي صلاحية الحظر \n")
else
return sendMsg(arg.ChatID,arg.MsgID,"• العضو 「 "..NameUser.." 」 \n• ملغيه حظره من قبل \n ") 
end
end,{ChatID=arg.ChatID,UserID=arg.UserID,MsgID=arg.MsgID,USERNAME=arg.USERNAME})
redis:srem(boss..'banned:'..arg.ChatID,arg.UserID)
else
return sendMsg(arg.ChatID,arg.MsgID,"• العضو 「 "..NameUser.." 」 \n• الغيت حظره \n ") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID,USERNAME=USERNAME})
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
if data.id_ == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* لا يمكنك تنفيذ الامر مع البوت \n") end 
local UserID = data.id_
UserName = arg.UserName
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..'banned:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"• العضو 「 "..NameUser.." 」 \n• ملغيه حظره من قبل \n ") 
else
sendMsg(arg.ChatID,arg.MsgID,"• العضو 「 "..NameUser.." 」 \n• الغيت حظره \n ") 
end
redis:srem(boss..'banned:'..arg.ChatID,UserID)
StatusLeft(arg.ChatID,UserID)
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="uban"}) 
end 
return false
end


if MsgText[1] == "كتم" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم البوت! \n") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم Dev 🎖 ياورع! \n") 
elseif UserID == 811166089 or UserID == 811166089 then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم Ace 🎖! \n") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم المطور! \n") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم المالك! \n") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم المالك الاساسي! \n") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم المدير! \n") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم الادمن\n") 
end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..'is_silent_users:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• مكتوم من قبل \n ") 
else
redis:hset(boss..'username:'..arg.UserID,'username',USERNAME)
redis:sadd(boss..'is_silent_users:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• كتمته \n ") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
UserName = arg.UserName
NameUser = Hyper_Link_Name(data)
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم البوت! \n") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم Dev 🎖 ياورع! \n") 
elseif UserID == 811166089 or UserID == 811166089 then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم Ace 🎖! \n") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم المطور! \n") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم المالك! \n") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم المالك الاساسي! \n") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم المدير! \n") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم الادمن! \n") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه مايمديك تكتم المميز! \n") 
end
if redis:sismember(boss..'is_silent_users:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• مكتوم من قبل \n ") 
else
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..'is_silent_users:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• كتمته \n ") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ktm"}) 
end
return false
end


if MsgText[1] == "الغاء الكتم" or MsgText[1] == "الغاء كتم" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..'is_silent_users:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"• العضو 「 "..NameUser.." 」 \n• ملغيه كتمه من قبل \n ") 
else
sendMsg(arg.ChatID,arg.MsgID,"• العضو 「 "..NameUser.." 」 \n• الغيت كتمه \n ") 
redis:srem(boss..'is_silent_users:'..arg.ChatID,arg.UserID)
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n ") end 
local UserID = data.id_
UserName = arg.UserName
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..'is_silent_users:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"• العضو 「 "..NameUser.." 」 \n• ملغيه كتمه من قبل \n ") 
else
redis:srem(boss..'is_silent_users:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"• العضو 「 "..NameUser.." 」 \n• الغيت كتمه \n ") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unktm"}) 
end 
return false
end


--{ Commands For locks }

if MsgText[1] == "قفل الكل"		 then return lock_All(msg) end
if MsgText[1] == "قفل الوسائط" 	 then return lock_Media(msg) end
if MsgText[1] == "قفل الصور بالتقييد" 	 then return tqeed_photo(msg) end
if MsgText[1] == "قفل الفيديو بالتقييد"  then return tqeed_video(msg) end
if MsgText[1] == "قفل المتحركه بالتقييد" then return tqeed_gif(msg) end
if MsgText[1] == "قفل التوجيه بالتقييد"  then return tqeed_fwd(msg) end
if MsgText[1] == "قفل الروابط بالتقييد"  then return tqeed_link(msg) end
if MsgText[1] == "قفل الدردشه"    	     then return mute_text(msg) end
if MsgText[1] == "قفل المتحركه" 		 then return mute_gif(msg) end
if MsgText[1] == "قفل الصور" 			 then return mute_photo(msg) end
if MsgText[1] == "قفل الفيديو"			 then return mute_video(msg) end
if MsgText[1] == "قفل البصمات" 		then return mute_voice(msg) 	end
if MsgText[1] == "قفل الصوت" 		then return mute_audio(msg) 	end
if MsgText[1] == "قفل الملصقات" 	then return mute_sticker(msg) end
if MsgText[1] == "قفل الجهات" 		then return mute_contact(msg) end
if MsgText[1] == "قفل التوجيه" 		then return mute_forward(msg) end
if MsgText[1] == "قفل الموقع"	 	then return mute_location(msg) end
if MsgText[1] == "قفل الملفات" 		then return mute_document(msg) end
if MsgText[1] == "قفل الاشعارات" 	then return mute_tgservice(msg) end
if MsgText[1] == "قفل الانلاين" 		then return mute_inline(msg) end
if MsgText[1] == "قفل الالعاب" 		then return mute_game(msg) end
if MsgText[1] == "قفل الكيبورد" 	then return mute_keyboard(msg) end
if MsgText[1] == "قفل الروابط" 		then return lock_link(msg) end
if MsgText[1] == "قفل الهاشتاق" 		then return lock_tag(msg) end
if MsgText[1] == "قفل المعرفات" 	then return lock_username(msg) end
if MsgText[1] == "قفل التعديل" 		then return lock_edit(msg) end
if MsgText[1] == "قفل الكلايش" 		then return lock_spam(msg) end
if MsgText[1] == "قفل التكرار" 		then return lock_flood(msg) end
if MsgText[1] == "قفل البوتات" 		then return lock_bots(msg) end
if MsgText[1] == "قفل البوتات بالطرد" 	then return lock_bots_by_kick(msg) end
if MsgText[1] == "قفل الماركدوان" 	then return lock_markdown(msg) end
if MsgText[1] == "قفل الويب" 		then return lock_webpage(msg) end 
if MsgText[1] == "قفل التثبيت" 		then return lock_pin(msg) end 
if MsgText[1] == "قفل الاضافه" 		then return lock_Add(msg) end 
if MsgText[1] == "قفل الانجليزية" or MsgText[1] == "قفل الانجليزيه"		then return lock_lang(msg) end 
if MsgText[1] == "قفل الفارسيه" 		then return lock_pharsi(msg) end 
if MsgText[1] == "قفل الفشار" or MsgText[1] == "قفل السب"		then return lock_mmno3(msg) end 


--{ Commands For Unlocks }
if MsgText[1] == "فتح الكل" then return Unlock_All(msg) end
if MsgText[1] == "فتح الوسائط" then return Unlock_Media(msg) end
if MsgText[1] == "فتح الصور بالتقييد" 		then return fktqeed_photo(msg) 	end
if MsgText[1] == "فتح الفيديو بالتقييد" 	then return fktqeed_video(msg) 	end
if MsgText[1] == "فتح المتحركه بالتقييد" 	then return fktqeed_gif(msg) 	end
if MsgText[1] == "فتح التوجيه بالتقييد" 	then return fktqeed_fwd(msg) 	end
if MsgText[1] == "فتح الروابط بالتقييد" 	then return fktqeed_link(msg) 	end
if MsgText[1] == "فتح المتحركه" 	then return unmute_gif(msg) 	end
if MsgText[1] == "فتح الدردشه" 		then return unmute_text(msg) 	end
if MsgText[1] == "فتح الصور" 		then return unmute_photo(msg) 	end
if MsgText[1] == "فتح الفيديو" 		then return unmute_video(msg) 	end
if MsgText[1] == "فتح البصمات" 		then return unmute_voice(msg) 	end
if MsgText[1] == "فتح الصوت" 		then return unmute_audio(msg) 	end
if MsgText[1] == "فتح الملصقات" 	then return unmute_sticker(msg) end
if MsgText[1] == "فتح الجهات" 		then return unmute_contact(msg) end
if MsgText[1] == "فتح التوجيه" 		then return unmute_forward(msg) end
if MsgText[1] == "فتح الموقع" 		then return unmute_location(msg) end
if MsgText[1] == "فتح الملفات" 		then return unmute_document(msg) end
if MsgText[1] == "فتح الاشعارات" 	then return unmute_tgservice(msg) end
if MsgText[1] == "فتح الانلاين" 		then return unmute_inline(msg) 	end
if MsgText[1] == "فتح الالعاب" 		then return unmute_game(msg) 	end
if MsgText[1] == "فتح الكيبورد" 	then return unmute_keyboard(msg) end
if MsgText[1] == "فتح الروابط" 		then return unlock_link(msg) 	end
if MsgText[1] == "فتح الهاشتاق" 		then return unlock_tag(msg) 	end
if MsgText[1] == "فتح المعرفات" 	then return unlock_username(msg) end
if MsgText[1] == "فتح التعديل" 		then return unlock_edit(msg) 	end
if MsgText[1] == "فتح الكلايش" 		then return unlock_spam(msg) 	end
if MsgText[1] == "فتح التكرار" 		then return unlock_flood(msg) 	end
if MsgText[1] == "فتح البوتات" 		then return unlock_bots(msg) 	end
if MsgText[1] == "فتح البوتات بالطرد" 	then return unlock_bots_by_kick(msg) end
if MsgText[1] == "فتح الماركدوان" 	then return unlock_markdown(msg) end
if MsgText[1] == "فتح الويب" 		then return unlock_webpage(msg) 	end
if MsgText[1] == "فتح التثبيت" 		then return unlock_pin(msg) end 
if MsgText[1] == "فتح الاضافه" 		then return unlock_Add(msg) end 
if MsgText[1] == "فتح الانجليزية" or MsgText[1] == "فتح الانجليزيه" 		then return unlock_lang(msg) end 
if MsgText[1] == "فتح الفارسيه" 		then  return unlock_pharsi(msg) end 
if MsgText[1] == "فتح الفشار" or MsgText[1] == "فتح السب" 	then return unlock_mmno3(msg) end 


if MsgText[1] == "وضع رابط" then
if not msg.Creator  then return "• هذا الامر يخص ( المطور,المالك الاساسي ,المالك ) بس  \n" end 
redis:setex(boss..'WiCmdLink'..msg.chat_id_..msg.sender_user_id_,500,true)
return '• تمام عيني  \n• الحين ارسل رابط مجموعتك \n '
end

if MsgText[1] == "انشاء رابط" then
if not msg.Creator then return "• هذا الامر يخص ( المطور,المالك الاساسي ,المالك ) بس  \n" end
if not redis:get(boss..'ExCmdLink'..msg.chat_id_) then
local LinkGp = ExportLink(msg.chat_id_)
if LinkGp then
LinkGp = LinkGp.result
redis:set(boss..'linkGroup'..msg.chat_id_,LinkGp)
redis:setex(boss..'ExCmdLink'..msg.chat_id_,120,true)
return sendMsg(msg.chat_id_,msg.id_,"*•* تم وسوينا رابط جديد \n• ["..LinkGp.."]\n• عشان تشوف الرابط ارسل ( الرابط ) \n ")
else
return sendMsg(msg.chat_id_,msg.id_,"• مايمديني اسوي رابط \n• لاني مو مشرف في المجموعة \n ")
end
else
return sendMsg(msg.chat_id_,msg.id_,"• تراك مسوي رابط من قبل \n• ارسل ( الرابط ) عشان تشوفه  \n ")
end
return false
end 

if MsgText[1] == "الرابط" then
if not redis:get(boss.."lock_linkk"..msg.chat_id_) then return "*•* الامر معطل من الادارة \n^"  end
if not redis:get(boss..'linkGroup'..msg.chat_id_) then return "*•* للاسف مافيه رابط \n*•*عشان تسوي رابط ارسل ( انشاء رابط ) \n " end
local GroupName = redis:get(boss..'group:name'..msg.chat_id_)
local GroupLink = redis:get(boss..'linkGroup'..msg.chat_id_)
return sendm(msg.chat_id_,msg.id_,"["..Flter_Markdown(GroupName).."]("..GroupLink..")")
end

if MsgText[1] == "وضع القوانين" or MsgText[1] == "وضع قوانين" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
redis:setex(boss..'rulse:witting'..msg.chat_id_..msg.sender_user_id_,300,true)
return '• تمام عيني  \n• الحين ارسل القوانين  اللي تبيها \n '
end

if MsgText[1] == "القوانين" then
if not redis:get(boss..'rulse:msg'..msg.chat_id_) then 
return "*•* اهلًا عزيزي القوانين كالاتي: \n• ممنوع نشر الروابط \n• ممنوع التكلم او نشر صور اباحيه \n• ممنوع  اعاده توجيه\n• ممنوع العنصرية بكل انواعها \n• الرجاء احترام المدراء والادمنيه "
else 
return "*•القوانين: *\n"..redis:get(boss..'rulse:msg'..msg.chat_id_) 
end 
end

if MsgText[1] == "وضع تكرار" or MsgText[1] == "وضع التكرار" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
local NumLoop = tonumber(MsgText[2])
if NumLoop < 1 or NumLoop > 50 then 
return "*•* حدود التكرار لازم تصير بين  *[2-50]*" 
end
redis:set(boss..'num_msg_max'..msg.chat_id_,MsgText[2]) 
return "*•* وسوينا التكرار ( *"..MsgText[2].."* )"
end

if MsgText[1] == "وضع وقت التنظيف" then
if not msg.Creator then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
local NumLoop = tonumber(MsgText[2])
redis:set(boss..':Timer_Cleaner:'..msg.chat_id_,NumLoop) 
return "*•* وحطينا وقت للتنظيف ( *"..MsgText[2].."* ) ساعة "
end

if MsgText[1] == "مسح المالكيين الاساسيين" or MsgText[1] == "مسح المالكين الاساسيين" or MsgText[1] == "مسح المالكيين الاساسين" or MsgText[1] == "مسح المالكين الاساسين" then 
if not msg.SudoUser then return "• هذا الامر يخص ( المطور ) بس  \n" end

local Admins = redis:scard(boss..':MONSHA_Group:'..msg.chat_id_)
if Admins == 0 then  
return "*•* مافيه مالكيين اساسيين عشان امسحهم! " 
end
redis:del(boss..':MONSHA_Group:'..msg.chat_id_)
return "• ابشر عيني "..msg.TheRankCmd.."   \n• مسحت ("..Admins..") من المالكيين الاساسيين \n "
end

if MsgText[1] == "مسح الرسائل المجدوله" or MsgText[1] == "مسح الميديا" or MsgText[1] == "مسح الوسائط" then 
if not msg.Creator then return "• هذا الامر يخص ( المطور,المالك ) بس  \n" end
local mmezz = redis:smembers(boss..":IdsMsgsCleaner:"..msg.chat_id_)
if #mmezz == 0 then return "• مافيه وسائط مجدوله للحذف أو \n• الامر معطل من المالك الاساسي \n  " end
for k,v in pairs(mmezz) do
Del_msg(msg.chat_id_,v)
end
return "• مسحت كل الوسائط المجدوله" 
end

if MsgText[1] == "مسح التعديلات"  or MsgText[1] == "مسح تكليجاتي" or MsgText[1] == "مسح تعديلاتي" then    
redis:del(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_)
return "• مسحت كل تكليجاتك" 
end

if MsgText[1] == "مسح الادمنيه" or MsgText[1] == "مسح الادمن" then 
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end

local Admins = redis:scard(boss..'admins:'..msg.chat_id_)
if Admins == 0 then  
return "*•* مافيه ادمنيه عشان امسحهم! \n " 
end
redis:del(boss..'admins:'..msg.chat_id_)
return "• ابشر عيني "..msg.TheRankCmd.."   \n• مسحت ("..Admins..") من الادمن \n "
end


if MsgText[1] == "مسح قائمه المنع" then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
local Mn3Word = redis:scard(boss..':Filter_Word:'..msg.chat_id_)
if Mn3Word == 0 then 
return "*•* مافيه كلمات ممنوعه عشان امسحها!" 
end
redis:del(boss..':Filter_Word:'..msg.chat_id_)
return "• ابشر عيني "..msg.TheRankCmd.."   \n• مسحت لك (*"..Mn3Word.."*) من كلمات المنع \n"
end


if MsgText[1] == "مسح القوانين" then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n " end
if not redis:get(boss..'rulse:msg'..msg.chat_id_) then 
return "• مافيه قوانين عشان امسحها! \n " 
end
redis:del(boss..'rulse:msg'..msg.chat_id_)
return "• ابشر عيني "..NameUser.."   \n• مسحت لك القوانين \n "
end


if MsgText[1] == "مسح الترحيب"  then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
if not redis:get(boss..'welcome:msg'..msg.chat_id_) then 
return "*•* مافيه ترحيب عشان امسحه! " 
end
redis:del(boss..'welcome:msg'..msg.chat_id_)
return "• ابشر عيني "..msg.TheRankCmd.."   \n• مسحت لك الترحيب \n "
end


if MsgText[1] == "مسح المالكيين" or MsgText[1] == "مسح المالكين" then
if not msg.SuperCreator    then return "• هذا الامر يخص ( المطور,المالك الاساسي ) بس  \n" end
local NumMnsha = redis:scard(boss..':MONSHA_BOT:'..msg.chat_id_)
if NumMnsha ==0 then 
return "• مافيه مالكيين عشان امسحهم! \n" 
end
redis:del(boss..':MONSHA_BOT:'..msg.chat_id_)
return "• ابشر عيني "..msg.TheRankCmd.."   \n•  مسحت (* "..NumMnsha.." *) من المالكيين\n "
end


if MsgText[1] == "مسح المدراء" then
if not msg.Creator then return "• هذا الامر يخص ( المطور,المالك ) بس  \n" end
local NumMDER = redis:scard(boss..'owners:'..msg.chat_id_)
if NumMDER ==0 then 
return "• مافيه مدراء عشان امسحهم! \n " 
end
redis:del(boss..'owners:'..msg.chat_id_)
return "• ابشر عيني "..msg.TheRankCmd.."   \n•  مسحت (* "..NumMDER.." *) من المدراء  \n "
end

if MsgText[1] == 'مسح المحظورين' then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end

local list = redis:smembers(boss..'banned:'..msg.chat_id_)
if #list == 0 then return "*• مافيه ناس محظوره!  *" end
message = '*•* قائمه الاعضاء المحظورين: \n'
for k,v in pairs(list) do
StatusLeft(msg.chat_id_,v)
end 
redis:del(boss..'banned:'..msg.chat_id_)
return "• ابشر عيني "..msg.TheRankCmd.."   \n• مسحت (* "..#list.." *) من المحظورين  \n "
end

if MsgText[1] == 'مسح المكتومين' then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n " end
local MKTOMEN = redis:scard(boss..'is_silent_users:'..msg.chat_id_)
if MKTOMEN ==0 then 
return "*•* مافيه احد مكتوم عشان امسحه! " 
end
redis:del(boss..'is_silent_users:'..msg.chat_id_)
return "• ابشر عيني "..msg.TheRankCmd.."   \n•  مسحت (* "..MKTOMEN.." *) من المكتومين  \n "
end

if MsgText[1] == 'مسح المميزين' then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
local MMEZEN = redis:scard(boss..'whitelist:'..msg.chat_id_)
if MMEZEN ==0 then 
return "*•* مافيه مميزين عشان امسحهم!  " 
end
redis:del(boss..'whitelist:'..msg.chat_id_)
return "• ابشر عيني "..msg.TheRankCmd.."   \n•  مسحت لك (* "..MMEZEN.." *) من المميزين  \n  "
end

if MsgText[1] == 'مسح الرابط' then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
if not redis:get(boss..'linkGroup'..msg.chat_id_) then 
return "*•* مافيه رابط مضاف اصلا " 
end
redis:del(boss..'linkGroup'..msg.chat_id_)
return "• ابشر عيني "..msg.TheRankCmd.."   \n• مسحت الرابط \n "
end


if MsgText[1] == "مسح" then
if not MsgText[2] and msg.reply_id then 
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
Del_msg(msg.chat_id_, msg.reply_id) 
Del_msg(msg.chat_id_, msg.id_) 
return false
end

if MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
if 400 < tonumber(MsgText[2]) then return "*•* حدود المسح لازم تصير بين  *[2-400]*" end
local DelMsg = MsgText[2] + 1
GetHistory(msg.chat_id_,DelMsg,function(arg,data)
All_Msgs = {}
for k, v in pairs(data.messages_) do
if k ~= 0 then
if k == 1 then
All_Msgs[0] = v.id_
else
table.insert(All_Msgs,v.id_)
end  
end 
end 
if tonumber(DelMsg) == data.total_count_ then
tdcli_function({ID="DeleteMessages",chat_id_ = msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*• مسحت ( *"..MsgText[2].."* ) من الرسايل * \n ")
end,nil)
else
tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*• مسحت ( *"..MsgText[2].."* ) من الرسايل *  \n ")
end,nil)
end
end)
return false
end
end 

--End del 

if MsgText[1] == "وضع اسم" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
redis:setex(boss..'name:witting'..msg.chat_id_..msg.sender_user_id_,300,true)
return "• تمام عيني  \n• الحين ارسل الاسم اللي تبيه للمجموعه \n "
end

if MsgText[1] == "حذف صوره" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
tdcli_function({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = {ID = "InputFileId", id_ = 0}},function(arg,data)
if data.message_ and data.message_ == "CHAT_NOT_MODIFIED" then
sendMsg(arg.ChatID,arg.MsgID,'• المجموعة مافيها صورة! \n')
elseif data.message_ and data.message_ == "CHAT_ADMIN_REQUIRED" then
sendMsg(arg.ChatID,arg.MsgID,'• معليش ماعندي صلاحية التعديل في المجموعة \n')
else
sendMsg(arg.ChatID,arg.MsgID,'• وحذفنا الصورة \n')
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false
end

if MsgText[1] == "وضع صوره" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then 
photo_id = data.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = data.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({
ID="ChangeChatPhoto",
chat_id_=arg.ChatID,
photo_ = GetInputFile(photo_id)},
function(arg,data)
if data.code_ and data.code_ == 3 then
return sendMsg(arg.ChatID,arg.MsgID,'• ماعندي صلاحية تغيير الصوره \n• لازم تعطيني صلاحيه `تغيير معلومات المجموعه  ⠀\n ')
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID})
end
end,{ChatID=msg.chat_id_,MsgID=msg.reply_id})
return false
else 
redis:setex(boss..'photo:group'..msg.chat_id_..msg.sender_user_id_,300,true)
return '• تمام عيني \n• الحين ارسل الصورة\n ' 
end 
end

if MsgText[1] == "وضع وصف" then 
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
redis:setex(boss..'about:witting'..msg.chat_id_..msg.sender_user_id_,300,true) 
return "• تمام عيني  \n• الحين ارسل الوصف اللي تبيه\n " 
end

if MsgText[1] == "تاق للكل" or MsgText[1] == "منشن للكل" then 
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
if not redis:get(boss.."lock_takkl"..msg.chat_id_) then  return "*↞* الامر معطل عشان تفعله ارسل ( `تفعيل المنشن` )" end 
return conslist(msg) .. ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end


if MsgText[1] == "منشن" or MsgText[1] == "تاق" then
if not msg.Admin then return "*•* هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس " end
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 100
},function(ta,hasn)
local t = "\n*𝗠𝗲𝗻𝘁𝗶𝗼𝗻* \n \n"
x = 0
local list = hasn.members_
for k, v in pairs(list) do
users = redis:get(boss..'user_names:'..v.user_id_) or v.user_id_
x = x + 1
t = t..""..x.." ( ["..users.."](tg://user?id="..v.user_id_..") ) \n"
end
send_msg(msg.chat_id_,t,msg.id_)
end,nil)
end


if MsgText[1] == "منع" then 
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
if MsgText[2] then
return AddFilter(msg, MsgText[2]) 
elseif msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == "MessageText" then
Type_id = data.content_.text_
elseif data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then Type_id = data.content_.photo_.sizes_[3].photo_.persistent_id_ else Type_id = data.content_.photo_.sizes_[0].photo_.persistent_id_ end
elseif data.content_.ID == "MessageSticker" then
Type_id = data.content_.sticker_.sticker_.persistent_id_
elseif data.content_.ID == "MessageVoice" then
Type_id = data.content_.voice_.voice_.persistent_id_
elseif data.content_.ID == "MessageAnimation" then
Type_id = data.content_.animation_.animation_.persistent_id_
elseif data.content_.ID == "MessageVideo" then
Type_id = data.content_.video_.video_.persistent_id_
elseif data.content_.ID == "MessageAudio" then
Type_id = data.content_.audio_.audio_.persistent_id_
elseif data.content_.ID == "MessageUnsupported" then
return sendMsg(arg.ChatID,arg.MsgID,"*•* معليش الرساله مو مدعومه ")
else
Type_id = 0
end

if redis:sismember(boss..':Filter_Word:'..arg.ChatID,Type_id) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* في قائمة المنع من قبل ")
else
redis:sadd(boss..':Filter_Word:'..arg.ChatID,Type_id) 
return sendMsg(arg.ChatID,arg.MsgID,"*•* واضفناها الى قائمة المنع ")
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end
return false 
end

if MsgText[1] == "الغاء منع" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
if MsgText[2] then
return RemFilter(msg,MsgText[2]) 
elseif msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if msg.content_.ID == "MessageText" then
Type_id = data.content_.text_
elseif data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then Type_id = data.content_.photo_.sizes_[3].photo_.persistent_id_ else Type_id = data.content_.photo_.sizes_[0].photo_.persistent_id_ end
elseif data.content_.ID == "MessageSticker" then
Type_id = data.content_.sticker_.sticker_.persistent_id_
elseif data.content_.ID == "MessageVoice" then
Type_id = data.content_.voice_.voice_.persistent_id_
elseif data.content_.ID == "MessageAnimation" then
Type_id = data.content_.animation_.animation_.persistent_id_
elseif data.content_.ID == "MessageVideo" then
Type_id = data.content_.video_.video_.persistent_id_
elseif data.content_.ID == "MessageAudio" then
Type_id = data.content_.audio_.audio_.persistent_id_
end
if redis:sismember(boss..':Filter_Word:'..arg.ChatID,Type_id) then 
redis:srem(boss..':Filter_Word:'..arg.ChatID,Type_id) 
return sendMsg(arg.ChatID,arg.MsgID,"*•* الغيت منعها ")
else
return sendMsg(arg.ChatID,arg.MsgID,"*•*  ملغيه منعها من قبل ")
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end
return false 
end

if MsgText[1] == "قائمه المنع" then 
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
return FilterXList(msg) 
end

if MsgText[1] == "الحمايه" then 
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
return settingsall(msg) 
end

if MsgText[1] == "الاعدادات" then 
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
return settings(msg) 
end

if MsgText[1] == "الوسائط" then 
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
return media(msg) 
end

if MsgText[1] == "الادمنيه" or MsgText[1] == "الادمن" then 
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
return GetListAdmin(msg) 
end

if MsgText[1] == "المدراء" then 
if not msg.Director  then return "• هذا الامر يخص ( المدير,المالك,المطور ) بس  \n" end
return ownerlist(msg) 
end

if MsgText[1] == "المالكيين"  or MsgText[1] == "المالكين" or MsgText[1] == "المالكيين الاساسيين" or MsgText[1] == "المالكين الاساسين" then 
if not msg.Creator  then return "• هذا الامر يخص ( المطور ,المالك الاساسي ,المالك  ) بس  \n" end
return conslist(msg)
end

if MsgText[1] == "المميزين" then 
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
return whitelist(msg) 
end

if MsgText[1] == "طرد البوتات" then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك ) بس  \n" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),filter_={ID="ChannelMembersBots"},offset_=0,limit_=50},function(arg,data)
local Total = data.total_count_ or 0
if Total == 1 then
return sendMsg(arg.ChatID,arg.MsgID,"• مافيه بوتات في المجموعة ") 
else
local NumBot = 0
local NumBotAdmin = 0
for k, v in pairs(data.members_) do
if v.user_id_ ~= our_id then
kick_user(v.user_id_,arg.ChatID,function(arg,data)
if data.ID == "Ok" then
NumBot = NumBot + 1
else
NumBotAdmin = NumBotAdmin + 1
end
local TotalBots = NumBot + NumBotAdmin  
if TotalBots  == Total - 1 then
local TextR  = "• عـدد الـبـوتات  {* "..(Total - 1).." *} \n\n"
if NumBot == 0 then 
TextR = TextR.."• مايمديني اطردهم لانهم مشرفين \n"
else
if NumBotAdmin >= 1 then
TextR = TextR.."• ماقدرت اطرد {* "..NumBotAdmin.." *} بوت لانهم مشرفين "
else
TextR = TextR.."• تم طردتهم كلهم \n"
end
end
return sendMsg(arg.ChatID,arg.MsgID,TextR) 
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID})
end
end
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false
end

if MsgText[1] == "كشف البوتات" then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID= "ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local total = data.total_count_ or 0
AllBots = '• قـائمة البوتات الـحالية\n\n'
local NumBot = 0
for k, v in pairs(data.members_) do
GetUserID(v.user_id_,function(arg,data)
if v.status_.ID == "ChatMemberStatusEditor" then
BotAdmin = "» *★*"
else
BotAdmin = ""
end
NumBot = NumBot + 1
AllBots = AllBots..NumBot..'- @['..data.username_..'] '..BotAdmin..'\n'
if NumBot == total then
AllBots = AllBots..[[

• موجود {]]..total..[[} بوت
• ملاحظة : الـ ★ يعني ان البوت مشرف في المجموعـة.]]
sendMsg(arg.ChatID,arg.MsgID,AllBots) 
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID})
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false
end

if MsgText[1] == 'طرد المحذوفين' then
if not msg.Creator then return "• هذا الامر يخص ( المطور,المالك ) بس  \n" end
sendMsg(msg.chat_id_,msg.id_,'• جاري البحث عـن الـحـسـابـات المـحذوفـة ...')
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100','')
,offset_ = 0,limit_ = 200},function(arg,data)
if data.total_count_ and data.total_count_ <= 200 then
Total = data.total_count_ or 0
else
Total = 200
end
local NumMem = 0
local NumMemDone = 0
for k, v in pairs(data.members_) do 
GetUserID(v.user_id_,function(arg,datax)
if datax.type_.ID == "UserTypeDeleted" then 
NumMemDone = NumMemDone + 1
kick_user(v.user_id_,arg.ChatID,function(arg,data)  
redis:srem(boss..':MONSHA_BOT:'..arg.ChatID,v.user_id_)
redis:srem(boss..'whitelist:'..arg.ChatID,v.user_id_)
redis:srem(boss..'owners:'..arg.ChatID,v.user_id_)
redis:srem(boss..'admins:'..arg.ChatID,v.user_id_)
end)
end
NumMem = NumMem + 1
if NumMem == Total then
if NumMemDone >= 1 then
sendMsg(arg.ChatID,arg.MsgID,"• طردت {* "..NumMemDone.." *} من الحسابات المحذوفة ")
else
sendMsg(arg.ChatID,arg.MsgID,'• مافيه حسابات محذوفة بالمجموعة')
end
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID})
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false
end  

if MsgText[1] == 'شحن' and MsgText[2] then
if not msg.SudoUser then return "• هذا الامر يخص ( المطور ) بس  \n" end
if tonumber(MsgText[2]) > 0 and tonumber(MsgText[2]) < 1001 then
local extime = (tonumber(MsgText[2]) * 86400)
redis:setex(boss..'ExpireDate:'..msg.chat_id_, extime, true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'• تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... ')
sendMsg(SUDO_ID,0,'• تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... \n• في مجموعه  » »  '..redis:get(boss..'group:name'..msg.chat_id_))
else
sendMsg(msg.chat_id_,msg.id_,'• عيني المطور \n• شحن الاشتراك يكون ما بين يوم الى 1000 يوم بس ')
end 
return false
end

if MsgText[1] == 'الاشتراك' and MsgText[2] then 
if not msg.SudoUser then return "• هذا الامر يخص ( المطور ) بس  \n" end
if MsgText[2] == '1' then
redis:setex(boss..'ExpireDate:'..msg.chat_id_, 2592000, true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'• تم تفعيل الاشتراك   \n•  الاشتراك » `30 يوم`  *(شهر)*')
sendMsg(SUDO_ID,0,'• تم تفعيل الاشتراك  \n•  الاشتراك » `30 يوم`  *(شهر)*')
end
if MsgText[2] == '2' then
redis:setex(boss..'ExpireDate:'..msg.chat_id_,7776000,true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'• تم تفعيل الاشتراك   \n•  الاشتراك » `90 يوم`  *(3 اشهر)*')
sendMsg(SUDO_ID,0,'• تم تفعيل الاشتراك   \n•  الاشتراك » `90 يوم`  *(3 اشهر)*')
end
if MsgText[2] == '3' then
redis:set(boss..'ExpireDate:'..msg.chat_id_,true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'• تم تفعيل الاشتراك   \n•  الاشتراك » `مفتوح`  *(مدى الحياة)*')
sendMsg(SUDO_ID,0,'• تم تفعيل الاشتراك   \n•  الاشتراك » `مفتوح`  *(مدى الحياة)*')
end 
return false
end

if MsgText[1] == 'الاشتراك' and not MsgText[2] and msg.Admin then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
local check_time = redis:ttl(boss..'ExpireDate:'..msg.chat_id_)
if check_time < 0 then return '*مـفـتـوح *🎖\n✓' end
year = math.floor(check_time / 31536000)
byear = check_time % 31536000 
month = math.floor(byear / 2592000)
bmonth = byear % 2592000 
day = math.floor(bmonth / 86400)
bday = bmonth % 86400 
hours = math.floor( bday / 3600)
bhours = bday % 3600 
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if tonumber(check_time) > 1 and check_time < 60 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..sec..'* ثانيه'
elseif tonumber(check_time) > 60 and check_time < 3600 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » '..min..' *دقيقه و * *'..sec..'* ثانيه'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 31536000 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..year..'* سنه و *'..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه' end
return remained_expire
end

if MsgText[1] == "الرتبه" and not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
GetChatMember(arg.ChatID,data.sender_user_id_,function(arg,data)
if data.status_ and data.status_.ID == "ChatMemberStatusEditor" then
SudoGroups = '*( مشرف )* '
elseif data.status_ and data.status_.ID == "ChatMemberStatusCreator" then 
SudoGroups = "*( المالك )*"
else
SudoGroups = "*( عضو )*"
end

Getrtb = Getrtba(arg.UserID,arg.ChatID)
GetUserID(arg.UserID,function(arg,data)
USERNAME = ResolveUserName(data)
USERCAR  = utf8.len(USERNAME)
SendMention(arg.ChatID,arg.UserID,arg.MsgID,'\n* ( '..USERNAME..' )*\n\n      *رتبته:* \n\n*•* في البوت '..arg.Getrtb..' \n*•* في المجموعة '..arg.SudoGroups..'\n',12,utf8.len(USERNAME)) 
end,{ChatID=arg.ChatID,UserID=arg.UserID,MsgID=arg.MsgID,Getrtb=Getrtb,SudoGroups=SudoGroups})
end,{ChatID=arg.ChatID,UserID=data.sender_user_id_,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false
end

if MsgText[1] == "كشف البوت" and not MsgText[2] then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
GetChatMember(msg.chat_id_,our_id,function(arg,data)
if data.status_.ID ~= "ChatMemberStatusMember" then 
sendMsg(arg.ChatID,arg.MsgID,'*•* تمام البوت ادمن الحين \n')
else 
sendMsg(arg.ChatID,arg.MsgID,'*•* لا البوت مو ادمن في المجموعة ')
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false 
end

if MsgText[1]== 'رسائلي' or MsgText[1] == 'رسايلي' or MsgText[1] == 'احصائياتي'  then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(boss..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(boss..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(boss..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(boss..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(boss..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(boss..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info =  "⠀⠀ { احـصـائـيـات رسايلك } \n \n"
.."• الـرسـائـل  { `"..msgs.."` } \n"
.."• الـجـهـات  { `"..NumGha.."` } \n"
.."• الـصـور  { `"..photo.."` } \n"
.."• الـمـتـحـركـه  { `"..animation.."` } \n"
.."• الـمـلـصـقات  { `"..sticker.."` } \n"
.."• الـبـصـمـات  { `"..voice.."` } \n"
.."• الـصـوت  { `"..audio.."` } \n"
.."• الـفـيـديـو  { `"..video.."` } \n"
.."• الـتـعـديـل  { `"..edited.."` } \n\n"
.."• تـفـاعـلـك   "..Get_Ttl(msgs).." \n"
.."\n "
return sendMsg(arg.chat_id_,arg.id_,Get_info)    
end,{chat_id_=msg.chat_id_,id_=msg.id_})
return false
end

if MsgText[1]== 'جهاتي' then
return '*•*  عدد جهاتك المضافة '..(redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..'  \n'
end

if MsgText[1] == 'معلوماتي' or MsgText[1] == 'موقعي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(boss..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(boss..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(boss..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(boss..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(boss..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(boss..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
USERNAME = ""
Name = data.first_name_
if data.last_name_ then Name = data.first_name_ .." "..data.last_name_ end
if data.username_ then USERNAME = "• المعرف ‹ @["..data.username_.."] ›\n" end 
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
if SUDO_USER:match('@[%a%d_]+') then 
SUDO_USERR = "\n "
else
SUDO_USERR = ""
end
local Get_info = "• اهلًا عزيزي هذي معلوماتك  \n"
.."┄─┅═ـ═┅─┄\n"
.."• الاســم ‹ "..FlterName(Name,25) .." ›\n"
..USERNAME
.."• الايـدي  ‹ `"..data.id_.."` › \n"
.."• رتبتــك ‹ "..arg.TheRank.." › \n"
.."• ــ  ‹ `"..arg.chat_id_.."` › \n"
.."┄─┅═ـ═┅─┄\n"
.."  ( احـصـائـيـات الـرسـايـل ) \n"
.."• الـرسـائـل ‹ `"..msgs.."` › \n"
.."• الـجـهـات ‹ `"..NumGha.."` › \n"
.."• الـصـور ‹ `"..photo.."` › \n"
.."• الـمـتـحـركـه ‹ `"..animation.."` ›\n"
.."• الـمـلـصـقات ‹ `"..sticker.."` ›\n"
.."• الـبـصـمـات ‹ `"..voice.."` ›\n"
.."• الـصـوت ‹ `"..audio.."` ›\n"
.."• الـفـيـديـو ‹ `"..video.."` › \n"
.."• الـتـعـديـل ‹ `"..edited.."` › \n\n"
.."• تـفـاعـلـك  ‹ "..Get_Ttl(msgs).." › \n"

..SUDO_USERR
sendMsg(arg.chat_id_,arg.id_,Get_info)    
end,{chat_id_=msg.chat_id_,id_=msg.id_,TheRank=msg.TheRank})
return false
end

if MsgText[1] == "تفعيل الردود المتعدده" or MsgText[1] == "تفعيل الردود المتعدده" 	then return unlock_replayRn(msg) end
if MsgText[1] == "تفعيل الردود" 	then return unlock_replay(msg) end
if MsgText[1] == "تفعيل الايدي" 	then return unlock_ID(msg) end
if MsgText[1] == "تفعيل الترحيب" 	then return unlock_Welcome(msg) end
if MsgText[1] == "تفعيل التحذير" 	then return unlock_waring(msg) end 
if MsgText[1] == "تفعيل الايدي بالصوره" 	then return unlock_idphoto(msg) end 
if MsgText[1] == "تفعيل الحمايه" or MsgText[1] == "تفعيل الحماية" 	then return unlock_AntiEdit(msg) end 
if MsgText[1] == "تفعيل المغادره" or MsgText[1] == "تفعيل اطردني"	then return unlock_leftgroup(msg) end 
if MsgText[1] == "تفعيل الحظر" 	then return unlock_KickBan(msg) end 
if MsgText[1] == "تفعيل الرابط" 	then return unlock_linkk(msg) end 
if MsgText[1] == "تفعيل المنشن" or MsgText[1] == "تفعيل التاق" or MsgText[1] == "تفعيل التاق للكل" or MsgText[1] == "تفعيل المنشن للكل" or MsgText[1] == "تفعيل منشن"	then return unlock_takkl(msg) end 
if MsgText[1] == "تفعيل التحقق" 		then return unlock_check(msg) end 
if MsgText[1] == "تفعيل التنظيف التلقائي" 		then return unlock_cleaner(msg) end 
if MsgText[1] == "تفعيل ردود المطور" 		then return unlock_rdodSource(msg) end 


if MsgText[1] == "تعطيل الردود المتعدده" or MsgText[1] == "تعطيل الردود المتعدده"	then return lock_replayRn(msg) end
if MsgText[1] == "تعطيل الردود" 	then return lock_replay(msg) end
if MsgText[1] == "تعطيل الايدي" 	then return lock_ID(msg) end
if MsgText[1] == "تعطيل الترحيب" 	then return lock_Welcome(msg) end
if MsgText[1] == "تعطيل التحذير" 	then return lock_waring(msg) end
if MsgText[1] == "تعطيل الايدي بالصوره" 	then return lock_idphoto(msg) end
if MsgText[1] == "تعطيل الحمايه" or MsgText[1] == "تعطيل الحماية"	then return lock_AntiEdit(msg) end
if MsgText[1] == "تعطيل المغادره" or MsgText[1] == "تعطيل اطردني"	then return lock_leftgroup(msg) end 
if MsgText[1] == "تعطيل الحظر" 	then return lock_KickBan(msg) end 
if MsgText[1] == "تعطيل الرابط" 	then return lock_linkk(msg) end 
if MsgText[1] == "تعطيل المنشن" or MsgText[1] == "تعطيل التاق" or MsgText[1] == "تعطيل التاق للكل" or MsgText[1] == "تعطيل المنشن للكل" or MsgText[1] == "تعطيل منشن"	then return lock_takkl(msg) end 
if MsgText[1] == "تعطيل التحقق" 		then return lock_check(msg) end 
if MsgText[1] == "تعطيل التنظيف التلقائي" 		then return lock_cleaner(msg) end 
if MsgText[1] == "تعطيل ردود المطور" 		then return lock_rdodSource(msg) end 


if MsgText[1] ==  'وضع ترحيب' or MsgText[1] =="وضع الترحيب" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
redis:set(boss..'welcom:witting'..msg.chat_id_..msg.sender_user_id_,true) 
return "• تمام عيني  \n• ارسل كليشه الترحيب الحين\n\n• ملاحظة تقدر تضيف دوال للترحيب مثلا :\n• اظهار قوانين المجموعه  ⇠ *{القوانين}*  \n• اظهار اسم العضو ⇠ *{الاسم}*\n• اظهار المعرف العضو ⇠ *{المعرف}*\n• اظهار اسم المجموعه ⇠ *{المجموعه}* \n• اظهار تاريخ دخول العضو ⇠ *{التاريخ}* \n• اظهار وقت دخول العضو ⇠ *{الوقت}* \n• اظهار بايو العضو ⇠ *{البايو}* \n  " 
end

if MsgText[1] == "الترحيب" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
if redis:get(boss..'welcome:msg'..msg.chat_id_)  then
return Flter_Markdown(redis:get(boss..'welcome:msg'..msg.chat_id_))
else 
return "\nاهلًا عزيزي {الاسم}\nمعرفك {المعرف}\nوقت دخولك {الوقت}\nتاريخ دخولك {التاريخ}\nاسم المجموعة {المجموعه}\n\n - Dev 🎖 تواصل مع المالك" 
end 
end

if MsgText[1] == "المكتومين" then 
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
return MuteUser_list(msg) 
end

if MsgText[1] == "المحظورين" then 
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
return GetListBanned(msg) 
end

if MsgText[1] == "رفع الادمنيه" or MsgText[1] == "رفع الادمن" then
if not msg.Creator then return "• هذا الامر يخص ( المطور,المالك ) بس  \n" end
return set_admins(msg) 
end

end -- end of insert group 
if MsgText[1] == "تعطيل الاذاعه"  or MsgText[1] =="تعطيل الاذاعه"	then return lock_brod(msg) end
if MsgText[1] == "تفعيل تعيين الايدي" or MsgText[1] =="تفعيل تعيين الايدي" 	then return unlock_idediit(msg) end 
if MsgText[1] == "تعطيل تعيين الايدي" or MsgText[1] =="تعطيل تعيين الايدي" 	then return lock_idediit(msg) end 
if MsgText[1] == "تفعيل الاذاعه" or MsgText[1] =="تفعيل الاذاعه" 	then return unlock_brod(msg) end



if MsgText[1] == 'مسح' and MsgText[2] == 'المطورين'  then
if not msg.SudoBase then return "• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
local mtwren = redis:scard(boss..':SUDO_BOT:')
if mtwren == 0 then  return "*•* معليش مافيه مطورين في البوت  ✖️" end
redis:del(boss..':SUDO_BOT:') 
return "*•* مسحت {* "..mtwren.." *} من المطورين \n "
end

if MsgText[1] == 'مسح' and MsgText[2] == "قائمه العام"  then
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
local addbannds = redis:scard(boss..'gban_users')
if addbannds ==0 then 
return "*• قائمة الحظر فاضيه .*" 
end
redis:del(boss..'gban_users') 
return "*•* مسحت { *"..addbannds.." *} من قائمه العام\n " 
end 

if MsgText[1] == "رفع منشئ اساسي" or MsgText[1] == "رفع مالك اساسي" then
if not msg.SudoUser then return "• هذا الامر يخص ( المطور ) بس  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"*•* مايمديني ارفع البوت \n ") 
end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"• الحلو「 "..NameUser.." 」 \n• مالك اساسي من قبل \n ") 
else
sendMsg(arg.ChatID,arg.MsgID,"• الحلو「 "..NameUser.." 」 \n• رفعته صار مالك اساسي \n ") 
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..':MONSHA_Group:'..arg.ChatID,arg.UserID)
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end


if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"• الحلو「 "..NameUser.." 」 \n• مالك اساسي من قبل \n ") 
else
redis:hset(boss..'username:'..UserID,'username',arg.UserName)
redis:sadd(boss..':MONSHA_Group:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"• الحلو「 "..NameUser.." 」 \n• رفعته صار مالك اساسي \n ") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="Upmonsh"}) 
end
return false
end

if MsgText[1] == "تنزيل مالك اساسي" or MsgText[1] == "تنزيل منشئ اساسي" then
if not msg.SudoUser then return "• هذا الامر يخص ( المطور ) بس  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\]],"")
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• مو مالك اساسي من قبل \n ") 
else
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• نزلته من المالك الاساسي \n ") 
redis:srem(boss..':MONSHA_Group:'..arg.ChatID,arg.UserID)
end  
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end


if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
UserName = Flter_Markdown(arg.UserName)
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• مو مالك اساسي من قبل \n ") 
else
redis:srem(boss..':MONSHA_Group:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• نزلته من المالك الاساسي \n ")
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 

if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="Dwmonsh"}) 
end

return false
end


if MsgText[1] == 'مسح كلايش التعليمات' then 
if not msg.SudoBase then return "• هذا الامر يخص ( مطور اساسي ) بس  \n" end
redis:del(boss..":awamer_Klesha_m1:")
redis:del(boss..":awamer_Klesha_m2:")
redis:del(boss..":awamer_Klesha_m3:")
redis:del(boss..":awamer_Klesha_mtwr:")
redis:del(boss..":awamer_Klesha_mrd:")
redis:del(boss..":awamer_Klesha_mf:")
redis:del(boss..":awamer_Klesha_m:")

sendMsg(msg.chat_id_,msg.id_,"*•* مسحت كلايش التعليمات  \n")
end

if MsgText[1] == 'مسح كليشه الايدي' or MsgText[1] == 'مسح الايدي' or MsgText[1] == 'مسح ايدي'  or MsgText[1] == 'مسح كليشة الايدي'  then 
if not msg.Creator then return "• هذا الامر يخص ( مالك اساسي,المالك,المطور ) بس  \n" end
redis:del(boss..":infoiduser_public:"..msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,"*•* ابشر مسحت الايدي  \n")
end

if MsgText[1] == 'تعيين كليشه الايدي' or MsgText[1] == 'تعيين الايدي' or MsgText[1] == 'تعيين ايدي'  or MsgText[1] == 'تعيين كليشة الايدي'  then 
if not msg.Creator then return "• هذا الامر يخص ( مالك اساسي,المالك,المطور ) بس  \n" end
redis:setex(boss..":Witting_KleshaID_public"..msg.chat_id_..msg.sender_user_id_,1000,true)
return '*•* تمام , الحين ارسل كليشه الايدي الجديده \n مع العلم ان الاختصارات كالاتي : \n \n{الاسم} : لوضع اسم المستخدم\n{الايدي} : لوضع ايدي المستخدم\n{المعرف} : لوضع معرف المستخدم \n{الرتبه} : لوضع نوع رتبه المستخدم \n{التفاعل} : لوضع تفاعل المستخدم \n{الرسائل} : لاظهار عدد الرسائل \n{المجوهرات} : لاظهار عدد المجوهرات \n{التعديل} : لاضهار عدد التعديلات  \n{البايو} : لاظهار بايو المستخدم\n{تعليق} : لاظهار تعليق متعدد للبايو \nقناة كلايش ايدي @idchange  \n' 
end


if MsgText[1] == "تنزيل الكل" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end

if not msg.reply_id and not MsgText[2]  then
if msg.SudoBase then
numMONSHA_Group = redis:scard(boss..':MONSHA_Group:'..msg.chat_id_)
numMONSHA = redis:scard(boss..':MONSHA_BOT:'..msg.chat_id_)
numowners = redis:scard(boss..'owners:'..msg.chat_id_)
numadmins = redis:scard(boss..'admins:'..msg.chat_id_)
numwhitelist = redis:scard(boss..'whitelist:'..msg.chat_id_)
redis:del(boss..':MONSHA_Group:'..msg.chat_id_)
redis:del(boss..':MONSHA_BOT:'..msg.chat_id_)
redis:del(boss..'owners:'..msg.chat_id_)
redis:del(boss..'admins:'..msg.chat_id_)
redis:del(boss..'whitelist:'..msg.chat_id_)
return "• اهلًا عزيزي "..msg.TheRankCmd.." ⇓\n• نزلت ❴ "..numMONSHA_Group.." ❵ من المالكيين الاساسيين\n• نزلت ❴ "..numMONSHA.." ❵ من المالكيين\n• نزلت ❴ "..numowners.." ❵ من المدراء\n• نزلت ❴ "..numadmins.." ❵ من الادمنيه\n• نزلت ❴ "..numwhitelist.." ❵ من المميزين\n\n " 
elseif msg.SudoUser then 
numMONSHA_Group = redis:scard(boss..':MONSHA_Group:'..msg.chat_id_)
numMONSHA = redis:scard(boss..':MONSHA_BOT:'..msg.chat_id_)
numowners = redis:scard(boss..'owners:'..msg.chat_id_)
numadmins = redis:scard(boss..'admins:'..msg.chat_id_)
numwhitelist = redis:scard(boss..'whitelist:'..msg.chat_id_)
redis:del(boss..':MONSHA_Group:'..msg.chat_id_)
redis:del(boss..':MONSHA_BOT:'..msg.chat_id_)
redis:del(boss..'owners:'..msg.chat_id_)
redis:del(boss..'admins:'..msg.chat_id_)
redis:del(boss..'whitelist:'..msg.chat_id_)
return "• اهلًا عزيزي "..msg.TheRankCmd.." ⇓\n• نزلت ❴ "..numMONSHA_Group.." ❵ من المالكيين الاساسيين\n• نزلت ❴ "..numMONSHA.." ❵ من المالكيين\n• نزلت ❴ "..numowners.." ❵ من المدراء\n• نزلت ❴ "..numadmins.." ❵ من الادمنيه\n• نزلت ❴ "..numwhitelist.." ❵ من المميزين\n\n " 
elseif msg.SuperCreator then 
numMONSHA = redis:scard(boss..':MONSHA_BOT:'..msg.chat_id_)
numowners = redis:scard(boss..'owners:'..msg.chat_id_)
numadmins = redis:scard(boss..'admins:'..msg.chat_id_)
numwhitelist = redis:scard(boss..'whitelist:'..msg.chat_id_)
redis:del(boss..':MONSHA_BOT:'..msg.chat_id_)
redis:del(boss..'owners:'..msg.chat_id_)
redis:del(boss..'admins:'..msg.chat_id_)
redis:del(boss..'whitelist:'..msg.chat_id_)
return "• اهلًا عزيزي "..msg.TheRankCmd.." ⇓\n• نزلت ❴ "..numMONSHA.." ❵ من المالكيين\n• نزلت ❴ "..numowners.." ❵ من المدراء\n• نزلت ❴ "..numadmins.." ❵ من الادمنيه\n• نزلت ❴ "..numwhitelist.." ❵ من المميزين\n\n " 
elseif msg.Creator then 
numowners = redis:scard(boss..'owners:'..msg.chat_id_)
numadmins = redis:scard(boss..'admins:'..msg.chat_id_)
numwhitelist = redis:scard(boss..'whitelist:'..msg.chat_id_)
redis:del(boss..'owners:'..msg.chat_id_)
redis:del(boss..'admins:'..msg.chat_id_)
redis:del(boss..'whitelist:'..msg.chat_id_)
return "• اهلًا عزيزي "..msg.TheRankCmd.." ⇓\n• نزلت ❴ "..numowners.." ❵ من المدراء\n• نزلت ❴ "..numadmins.." ❵ من الادمنيه\n• نزلت ❴ "..numwhitelist.." ❵ من المميزين\n\n " 
elseif msg.Director then 
numadmins = redis:scard(boss..'admins:'..msg.chat_id_)
numwhitelist = redis:scard(boss..'whitelist:'..msg.chat_id_)
redis:del(boss..'admins:'..msg.chat_id_)
redis:del(boss..'whitelist:'..msg.chat_id_)
return "• اهلًا عزيزي "..msg.TheRankCmd.." ⇓\n• نزلت ❴ "..numadmins.." ❵ من الادمنيه\n• نزلت ❴ "..numwhitelist.." ❵ من المميزين\n\n " 
elseif msg.Admin then 
numwhitelist = redis:scard(boss..'whitelist:'..msg.chat_id_)
redis:del(boss..'whitelist:'..msg.chat_id_)
return "• اهلًا عزيزي "..msg.TheRankCmd.." ⇓\n• نزلت ❴ "..numwhitelist.." ❵ من المميزين\n\n " 
end
end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(msg.chat_id_,msg.id_,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
msg = arg.msg
msg.UserID = UserID
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
msg = arg.msg
UserID = msg.UserID
if UserID == our_id then return sendMsg(msg.chat_id_,msg.id_,"*•* مايمديك تسوي الامر مع البوت \n") end
if UserID == 811166089 or UserID == 811166089 then return sendMsg(msg.chat_id_,msg.id_,"*•* مايمديك تنزل Ace 🎖 \n") end

if UserID == SUDO_ID then 
rinkuser = 1
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
rinkuser = 2
elseif redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,UserID) then 
rinkuser = 3
elseif redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
rinkuser = 4
elseif redis:sismember(boss..'owners:'..msg.chat_id_,UserID) then 
rinkuser = 5
elseif redis:sismember(boss..'admins:'..msg.chat_id_,UserID) then 
rinkuser = 6
elseif redis:sismember(boss..'whitelist:'..msg.chat_id_,UserID) then 
rinkuser = 7
else
rinkuser = 8
end
local DonisDown = "\n• طيرناه من الرتب التاليه : \n\n "
if redis:sismember(boss..':SUDO_BOT:',UserID) then 
DonisDown = DonisDown.."المطور ✘\n"
end 
if redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المالك الاساسي  ✘️\n"
end 
if redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المالك ✘\n"
end 
if redis:sismember(boss..'owners:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المدير ✘\n"
end 
if redis:sismember(boss..'admins:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."الادمن ✘\n"
end 
if redis:sismember(boss..'whitelist:'..msg.chat_id_,UserID) then
DonisDown = DonisDown.."العضو مميز ✘\n"
end
function senddwon() sendMsg(msg.chat_id_,msg.id_,"*•* رتبته اعلى منك مايمديك تنزله! \n") end
function sendpluse() sendMsg(msg.chat_id_,msg.id_,"*•* رتبته مثلك مايمديك تنزله! : "..msg.TheRankCmd.." \n") end

if rinkuser == 8 then return sendMsg(msg.chat_id_,msg.id_,"「 "..NameUser.." 」   \n• عضو من قبل \n ")  end
huk = false
if msg.SudoBase then 
redis:srem(boss..':SUDO_BOT:',UserID)
redis:srem(boss..':MONSHA_Group:'..msg.chat_id_,UserID)
redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.SudoUser then 
if rinkuser == 2 then return sendpluse() end
if rinkuser < 2 then return senddwon() end
redis:srem(boss..':MONSHA_Group:'..msg.chat_id_,UserID)
redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.SuperCreator then 
if rinkuser == 3 then return sendpluse() end
if rinkuser < 3 then return senddwon() end
redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Creator then 
if rinkuser == 4 then return sendpluse() end
if rinkuser < 5 then return senddwon() end
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Director then 
if rinkuser == 5 then return sendpluse() end
if rinkuser < 5 then return senddwon() end
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Admin then 
if rinkuser == 6 then return sendpluse() end
if rinkuser < 6 then return senddwon() end
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
else
huk = true
end

if not huk then sendMsg(msg.chat_id_,msg.id_,"「 "..NameUser.." 」 \n"..DonisDown.."\n ") end

end,{msg=msg})
end,{msg=msg})
end


if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تسوي الامر مع البوت\n") end

msg = arg.msg
if UserID == 811166089 or UserID == 811166089 then return sendMsg(msg.chat_id_,msg.id_,"*•* مايمديك تنزل Ace 🎖 \n") end
NameUser = Hyper_Link_Name(data)

if UserID == SUDO_ID then 
rinkuser = 1
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
rinkuser = 2
elseif redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,UserID) then 
rinkuser = 3
elseif redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
rinkuser = 4
elseif redis:sismember(boss..'owners:'..msg.chat_id_,UserID) then 
rinkuser = 5
elseif redis:sismember(boss..'admins:'..msg.chat_id_,UserID) then 
rinkuser = 6
elseif redis:sismember(boss..'whitelist:'..msg.chat_id_,UserID) then 
rinkuser = 7
else
rinkuser = 8
end
local DonisDown = "\n• طيرناه من الرتب التاليه : \n\n "
if redis:sismember(boss..':SUDO_BOT:',UserID) then 
DonisDown = DonisDown.."المطور ✘\n"
end 
if redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المالك الاساسي  ✘️\n"
end 
if redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المالك ✘\n"
end 
if redis:sismember(boss..'owners:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."المدير ✘\n"
end 
if redis:sismember(boss..'admins:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."الادمن ✘\n"
end 
if redis:sismember(boss..'whitelist:'..msg.chat_id_,UserID) then
DonisDown = DonisDown.."العضو المميز ✘\n"
end

function senddwon() sendMsg(msg.chat_id_,msg.id_,"*•* رتبته اعلى منك مايمديك تنزله! \n") end
function sendpluse() sendMsg(msg.chat_id_,msg.id_,"*•* رتبته مثلك مايمديك تنزله! : "..msg.TheRankCmd.." \n") end

if rinkuser == 8 then return sendMsg(msg.chat_id_,msg.id_,"「 "..NameUser.." 」   \n• عضو من قبل \n ")  end
huk = false
if msg.SudoBase then 
redis:srem(boss..':SUDO_BOT:',UserID)
redis:srem(boss..':MONSHA_Group:'..msg.chat_id_,UserID)
redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.SudoUser then 
if rinkuser == 2 then return sendpluse() end
if rinkuser < 2 then return senddwon() end
redis:srem(boss..':MONSHA_Group:'..msg.chat_id_,UserID)
redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.SuperCreator then 
if rinkuser == 3 then return sendpluse() end
if rinkuser < 3 then return senddwon() end
redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Creator then 
if rinkuser == 4 then return sendpluse() end
if rinkuser < 5 then return senddwon() end
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Director then 
if rinkuser == 5 then return sendpluse() end
if rinkuser < 5 then return senddwon() end
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Admin then 
if rinkuser == 6 then return sendpluse() end
if rinkuser < 6 then return senddwon() end
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
else
huk = true
end

if not huk then sendMsg(msg.chat_id_,msg.id_,"「 "..NameUser.." 」 \n"..DonisDown.."\n ") end

end,{msg=msg})
end 

if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="DwnAll"}) 
end

return false
end



--=====================================================================================


if MsgText[1] == "قائمه الاوامر" or MsgText[1] == "قائمة الاوامر" then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
local list = redis:hgetall(boss..":AwamerBotArray2:"..msg.chat_id_)
local list2 = redis:hgetall(boss..":AwamerBotArray:"..msg.chat_id_)
message = "*الاوامر الجديده :* \n\n" i = 0
for name,Course in pairs(list) do i = i + 1 message = message ..i..' - *(* '..name..' *)* ⇠ '..Course..' \n'  end 
if i == 0 then return "*•* مافيه اوامر مضافه \n " end
return message
end


if MsgText[1] == "مسح الاوامر" or MsgText[1] == "مسح قائمة الاوامر" then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
local Awammer 	= redis:del(boss..":AwamerBot:"..msg.chat_id_)
redis:del(boss..":AwamerBotArray:"..msg.chat_id_)
redis:del(boss..":AwamerBotArray2:"..msg.chat_id_)
if Awammer ~= 0 then
return "• مسحت قائمة الاوامر \n..."
else
return "*•* القائمة ممسوحه من قبل \n"
end
end


if MsgText[1] == "تغيير امر" or MsgText[1] == "تغير امر" or MsgText[1] == "اضف امر" then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
if MsgText[2] then

local checkAmr = false
for k, Boss in pairs(XBoss) do if MsgText[2]:match(Boss) then  checkAmr = true end end      
if checkAmr then
redis:setex(boss..":Witting_changeamr:"..msg.chat_id_..msg.sender_user_id_,300,MsgText[2])
return "• تمام عيني , عشان تغير امر (* "..MsgText[2].." *)  ارسل الامر الجديد \n"
else
return "*•* معليش الامر مو موجود بالبوت عشان تغييره  \n"
end
else
redis:setex(boss..":Witting_changeamr2:"..msg.chat_id_..msg.sender_user_id_,300,true)
return "• تمام عيني , عشان تغيير الامر  ارسل الامر القديم \n"
end
end

if MsgText[1] == "مسح امر"  then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
if MsgText[2] then
local checkk = redis:hdel(boss..":AwamerBotArray2:"..msg.chat_id_,MsgText[2])
local AmrOld = redis:hgetall(boss..":AwamerBotArray:"..msg.chat_id_)
amrnew = ""
amrold = ""
amruser = MsgText[2].." @user"
amrid = MsgText[2].." 23434"
amrklma = MsgText[2].." ffffff"
amrfile = MsgText[2].." fff.lua"
for Amor,ik in pairs(AmrOld) do
if MsgText[2]:match(Amor) then			
print("¦AMrnew : "..Amor,"¦AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
elseif amruser:match(Amor) then
print("¦AMrnew : "..Amor,"¦AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
elseif amrid:match(Amor) then
print("¦AMrnew : "..Amor,"¦AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
elseif amrklma:match(Amor) then
print("¦AMrnew : "..Amor,"¦AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
elseif amrfile:match(Amor) then
print("¦AMrnew : "..Amor,"¦AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
end
end
if checkk ~=0 then
return "• مسحت {* "..MsgText[2].." *} من قائمة الاومر \n..."
else
return "• هذا الامر مو موجود ضمن الاوامر المضافة  \n"
end
else
redis:setex(boss..":Witting_AmrDel:"..msg.chat_id_..msg.sender_user_id_,300,true)
return "•  ارسل الامر الجديد المضاف بالقوائم الحين\n..."
end


end


--=====================================================================================


if msg.SudoBase then

if MsgText[1] == "نقل ملكيه البوت" or MsgText[1] == "نقل ملكيه البوت" then
redis:setex(boss..":Witting_MoveBot:"..msg.chat_id_..msg.sender_user_id_,300,true)
return "• تمام عيني  \n• الحين ارسل معرف المستخدم لنقل ملكية البوت له ."
end





if MsgText[1] == 'تعيين قائمه الاوامر' then 
redis:setex(boss..":Witting_awamr_witting"..msg.chat_id_..msg.sender_user_id_,1000,true)
return '*•* ارسل امر القائمه المراد تعيينهم مثل الاتي "\n¦`الاوامر` , `م1` , `م2 `, `م3 `, `م المطور ` , `اوامر الرد `,  `اوامر الملفات` \n➼' 
end


if MsgText[1] == "رفع مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"*•* مايمديني ارفع بوت \n") 
end
GetUserID(UserID,function(arg,data)
RUSERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..':SUDO_BOT:',arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"• الحلو「 "..NameUser.." 」 \n• مطور من قبل \n ") 
else
sendMsg(arg.ChatID,arg.MsgID,"• الحلو「 "..NameUser.." 」 \n• رفعته صار مطور \n ") 
redis:hset(boss..'username:'..arg.UserID,'username',RUSERNAME)
redis:sadd(boss..':SUDO_BOT:',arg.UserID)
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end


if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
ReUsername = arg.UserName
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..':SUDO_BOT:',UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"• الحلو「 "..NameUser.." 」 \n• مطور من قبل \n ") 
else
redis:hset(boss..'username:'..UserID,'username',ReUsername)
redis:sadd(boss..':SUDO_BOT:',UserID)
sendMsg(arg.ChatID,arg.MsgID,"• الحلو「 "..NameUser.." 」 \n• رفعته صار مطور \n ") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 


if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="up_sudo"}) 
end
return false
end

if MsgText[1] == "تنزيل مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..':SUDO_BOT:',arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• مو مطور من قبل \n ") 
else
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• نزلته من المطور \n ") 
redis:srem(boss..':SUDO_BOT:',arg.UserID)
end  
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end
--================================================
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..':SUDO_BOT:',UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• مو مطور من قبل \n ") 
else
redis:srem(boss..':SUDO_BOT:',UserID)
sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• نزلته من المطور \n  ") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="dn_sudo"}) 
end
return false
end

if MsgText[1] == "تنظيف المجموعات" then
local groups = redis:smembers(boss..'group:ids')
local GroupsIsFound = 0
for i = 1, #groups do 
GroupTitle(groups[i],function(arg,data)
if data.code_ and data.code_ == 400 then
rem_data_group(groups[i])
print(" Del Group From list ")
else
print(" Name Group : "..data.title_)
GroupsIsFound = GroupsIsFound + 1
end
print(GroupsIsFound..' : '..#groups..' : '..i)
if #groups == i then
local GroupDel = #groups - GroupsIsFound 
if GroupDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'*•* حلو , مافيه مجموعات وهميه \n')
else
sendMsg(msg.chat_id_,msg.id_,'*•* عدد المجموعات •⊱ { *'..#groups..'*  } ⊰•\n*•* تـم تنظيف  •⊱ { *'..GroupDel..'*  } ⊰• مجموعه \n*•* صار العدد الحقيقي الحين •⊱ { *'..GroupsIsFound..'*  } ⊰• مجموعه \n ')
end
end
end)
end
return false
end
if MsgText[1] == "تنظيف المشتركين" then
local pv = redis:smembers(boss..'users')
local NumPvDel = 0
for i = 1, #pv do
GroupTitle(pv[i],function(arg,data)
sendChatAction(pv[i],"Typing",function(arg,data)
if data.ID and data.ID == "Ok"  then
print("Sender Ok")
else
print("Failed Sender Nsot Ok")
redis:srem(boss..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
if NumPvDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'• تمام , مافي مشتركين وهميين')
else
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'*•* عدد المشتركين •⊱ { *'..#pv..'*  } ⊰•\n*•* تـم تنظيف  •⊱ { *'..NumPvDel..'*  } ⊰• مشترك \n*•* صار العدد الحقيقي الحين •⊱ { *'..SenderOk..'*  } ⊰• من المشتركين \n') 
end
end
end)
end)
end
return false
end
if MsgText[1] == "وضع صوره للترحيب" or MsgText[1]=="ضع صوره للترحيب" then
redis:setex(boss..'welcom_ph:witting'..msg.sender_user_id_,300,true) 
return'• تمام عيني \n• الحين ارسل الصوره للترحيب \n ' 
end

if MsgText[1] == "تعطيل البوت خدمي"  or MsgText[1] == "تعطيل البوت خدمي" then 
return lock_service(msg) 
end

if MsgText[1] == "تفعيل البوت خدمي" or MsgText[1] == "تفعيل البوت خدمي" then 
return unlock_service(msg) 
end

if MsgText[1] == "صوره الترحيب" then
local Photo_Weloame = redis:get(boss..':WELCOME_BOT')
if Photo_Weloame then
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
if SUDO_USER:match('@[%a%d_]+') then 
SUDO_USERR = "• المطور "..SUDO_USER.." \n"
else
SUDO_USERR = ""
end
sendPhoto(msg.chat_id_,msg.id_,Photo_Weloame,[[*اهلًا بك عزيزي في بوت*]]..redis:get(boss..':NameBot:')..[[ 🧚‍♀️

• اختصاصي ادارة المجموعات من السبام والخ..
• كت تويت, يوتيوب , واشياء كثير ..
• عشان تفعلني ارفعني اشراف وارسل تفعيل.

]]..SUDO_USERR)
return false
else
return "• مافيه صوره مضافه للترحيب في البوت \n• لاضافه صوره الترحيب ارسل `ضع صوره للترحيب`"
end
end

if MsgText[1] == "ضع كليشه المطور" then 
redis:setex(boss..'text_sudo:witting'..msg.sender_user_id_,1200,true) 
return '• تمام عيني \n• الحين ارسل الكليشه \n ' 
end

if MsgText[1] == "وضع شرط التفعيل" and MsgText[2] and MsgText[2]:match('^%d+$') then 
redis:set(boss..':addnumberusers',MsgText[2]) 
return '*•* وضعت شـرط تفعيل البوت اذا كانت المجموعة‏‏ اكثر من *【'..MsgText[2]..'】* عضـو  ༄\n' 
end

if MsgText[1] == "شرط التفعيل" then 
return'*•* شـرط شـرط تفعيل البوت اذا كانت المجموعة‏‏ اكثر من *【'..redis:get(boss..':addnumberusers')..'】* عضـو  ༄\n' 
end 
end

if MsgText[1] == 'المجموعات' or MsgText[1] == "المجموعات 🔝" then 
if not msg.SudoUser then return "• هذا الامر يخص ( المطور ) بس  \n" end
return '*•* عدد المجموعات المفعلة ⇠ `'..redis:scard(boss..'group:ids')..'`  ➼' 
end

if MsgText[1] == 'مسح كليشه الايدي عام' or MsgText[1] == 'مسح الايدي عام' or MsgText[1] == 'مسح ايدي عام'  or MsgText[1] == 'مسح كليشة الايدي عام' or MsgText[1] == 'مسح كليشه الايدي عام' then 
if not msg.SudoUser then return "• هذا الامر يخص ( المطور ) بس  \n" end
if not msg.SudoBase and not redis:get(boss.."lockidedit") then return "*•* الامر معطل من Dev 🎖  \n" end
redis:del(boss..":infoiduser")
return sendMsg(msg.chat_id_,msg.id_,"*•* مسحت كليشة الايدي العام \n")
end

if MsgText[1] == 'تعيين كليشه الايدي عام' or MsgText[1] == 'عام تعيين الايدي' or MsgText[1] == 'تعيين ايدي عام'  or MsgText[1] == 'تعيين كليشة الايدي عام'  or MsgText[1] == 'تعيين كليشه الايدي عام' then 
if not msg.SudoUser then return "• هذا الامر يخص ( المطور ) بس  \n" end
if not msg.SudoBase and not redis:get(boss.."lockidedit") then return "*•* تعيين الايدي معطل من Dev 🎖  \n" end
redis:setex(boss..":Witting_KleshaID"..msg.chat_id_..msg.sender_user_id_,1000,true)
return '*•* تمام , الحين ارسل كليشه الايدي الجديده \n علما ان الاختصارات كالاتي : \n \n{الاسم} : لوضع اسم المستخدم\n{الايدي} : لوضع ايدي المستخدم\n{المعرف} : لوضع معرف المستخدم \n{الرتبه} : لوضع نوع رتبه المستخدم \n{التفاعل} : لوضع تفاعل المستخدم \n{الرسائل} : لاضهار عدد الرسائل \n{المجوهرات} : لاضهار عدد المجوهرات \n{التعديل} : لاضهار عدد السحكات \n{البوت} : لاضهار اسم البوت\n{المطور} : لاضهار معرف Dev 🎖\n قناه تعليمات ونشر كلايش الايدي \n قناه الكلايش : [@idchange] \n➼' 
end


if MsgText[1] == 'قائمه المجموعات' then 
if not msg.SudoBase then return "• هذا الامر يخص ( المطور ) بس  \n" end
return chat_list(msg) 
end


if MsgText[1] == 'تعطيل' and MsgText[2] and MsgText[2]:match("(%d+)") then
if not msg.SudoUser then return "• هذا الامر يخص ( المطور ) بس  \n" end
local idgrup = "-100"..MsgText[2]
local name_gp = redis:get(boss..'group:name'..idgrup)
GroupTitle(idgrup,function(arg,data)
if data.ID and data.ID == "Error" and data.message_ == "CHANNEL_INVALID" then
if redis:sismember(boss..'group:ids',arg.Group) then
rem_data_group(arg.Group)
sendMsg(arg.chat_id_,arg.id_,'*•* البوت مو بالمجموعة ولكن مسحت بياناتها \n*•* المجموعة ⇠ ['..arg.name_gp..']\n*•* الايدي » ( *'..arg.Group..'* )\n')
else 
sendMsg(arg.chat_id_,arg.id_,'*•* البوت مو مفعل بالمجموعه \n*•* ومافيه بيانات لها \n ')
end
else
StatusLeft(arg.Group,our_id)
if redis:sismember(boss..'group:ids',arg.Group) then
sendMsg(arg.Group,0,'*•* عطلت المجموعة بأمر من المطور  \n*¦* بطلع انقلعوا \n')
rem_data_group(arg.Group)
sendMsg(arg.chat_id_,arg.id_,'*•* تم تعطيل المجموعه ومغادرتها \n*•* المجموعة » ['..arg.name_gp..']\n*•* الايدي ⇠ ( *'..arg.Group..'* )\n')
else 
sendMsg(arg.chat_id_,arg.id_,'*•* البوت مو مفعل بالمجموعة \n*•* ولكن تم مغادرتها\n*•* المجموعة ⇠ ['..arg.name_gp..']\n')
end
end 
end,{chat_id_=msg.chat_id_,id_=msg.id_,Group=idgrup,name_gp=name_gp})
return false
end

if MsgText[1] == 'المطور' then
return redis:get(boss..":TEXT_SUDO") or '• مافيه كليشه المطور .\n• يمديك تضيف كليشه من خلال الامر\n       " `ضع كليشه المطور` " \n📡'
end

if MsgText[1] == "اذاعه بالتثبيت"  or MsgText[1] =="اذاعه بالتثبيت" then
if not msg.SudoUser then return"• هذا الامر يخص ( المطور ) بس  \n" end
redis:setex(boss..':prod_pin:'..msg.chat_id_..msg.sender_user_id_,300, true) 
return "• تمام الحين ارسل رساله عشان اذيعها بالتثبيت  \n" 
end

if MsgText[1] == "اذاعه عام بالتوجيه" or MsgText[1] == "اذاعه عام بالتوجيه" then
if not msg.SudoUser then return"• هذا الامر يخص ( المطور ) بس  \n" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "*•* الاذاعه مقفوله من Dev 🎖  " 
end
redis:setex(boss..'fwd:'..msg.sender_user_id_,300, true) 
return "• حسننا الان ارسل التوجيه للاذاعه \n🔛" 
end

if MsgText[1] == "اذاعه عام" or MsgText[1] == "اذاعه عام" then		
if not msg.SudoUser then return"• هذا الامر يخص ( المطور ) بس  \n" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "*•* الاذاعه مقفوله من قبل Dev 🎖  🚶" 
end
redis:setex(boss..'fwd:all'..msg.sender_user_id_,300, true) 
return "• تمام الحين ارسل الكليشه للاذاعه عام \n🔛" 
end

if MsgText[1] == "اذاعه خاص" or MsgText[1] == "اذاعه خاص" then		
if not msg.SudoUser then return "• هذا الامر يخص ( المطور ) بس  \n" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "*•* الاذاعه مقفوله من Dev 🎖  🚶" 
end
redis:setex(boss..'fwd:pv'..msg.sender_user_id_,300, true) 
return "• تمام الحين ارسل الكليشه للاذاعه خاص \n🔛"
end

if MsgText[1] == "اذاعه" or MsgText[1] == "اذاعه" then		
if not msg.SudoUser then return"• هذا الامر يخص ( المطور ) بس  \n" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "*•* الاذاعه مقفوله من Dev 🎖  🚶" 
end
redis:setex(boss..'fwd:groups'..msg.sender_user_id_,300, true) 
return "• تمام الحين ارسل الكليشه للاذاعه للمجموعات \n🔛" 
end

if MsgText[1] == "المطورين" or MsgText[1] == "المطورين" then
if not msg.SudoUser then return"• هذا الامر يخص ( المطور ) بس  \n" end
return sudolist(msg) 
end

if MsgText[1] == "قائمه العام" or MsgText[1]=="قائمه العام" then 
if not msg.SudoUser then return"• هذا الامر يخص ( المطور ) بس  \n" end
return GetListGeneralBanned(msg) 
end

if MsgText[1] == "تعطيل التواصل" or MsgText[1]=="تعطيل التواصل" then 
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
return lock_twasel(msg) 
end

if MsgText[1] == "تفعيل التواصل" or MsgText[1]=="تفعيل التواصل" then 
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
return unlock_twasel(msg) 
end

if MsgText[1] == "حظر عام" then
if not msg.SudoBase then return "• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تحظر البوت\n ") 
elseif  UserID == 811166089 or UserID == 811166089 then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تحظر Ace 🎖\n ")
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تحظر Dev 🎖\n ")
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تحظر المطور\n ") 
end
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
USERNAME = ResolveUserName(data)
if GeneralBanned(arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• محظور عام من قبل \n ") 
else
redis:hset(boss..'username:'..arg.UserID,'username',USERNAME)
redis:sadd(boss..'gban_users',arg.UserID)
kick_user(arg.UserID,arg.ChatID)
return sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• حظرته عام \n ") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
UserName = arg.UserName
NameUser = Hyper_Link_Name(data)

if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تحظر البوت\n ") 
elseif  UserID == 811166089 or UserID == 811166089 then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تحظر Ace 🎖\n ")
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديك تحظر Dev 🎖\n ")
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* مايميدك تحظر المطور\n ") 
end
if redis:sismember(boss..'gban_users',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• محظور عام من قبل \n ") 
else
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..'gban_users',UserID)
kick_user(UserID,arg.ChatID)
return sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• حظرته عام \n ") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="bandall"}) 
end
return false
end

if MsgText[1] == "الغاء العام" or MsgText[1] == "الغاء عام" then
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* هذا العضو مو موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)

if GeneralBanned(arg.UserID) then 
redis:srem(boss..'gban_users',arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• ملغيه حظره عام من قبل \n ") 
else
return sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• الغيت حظره عام \n ") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.reply_id})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unbandall"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
local UserID = data.id_
UserName = arg.UserName
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..'gban_users',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• ملغيه حظره عام من قبل \n ") 
else
redis:srem(boss..'gban_users',UserID)
return sendMsg(arg.ChatID,arg.MsgID,"「 "..NameUser.." 」 \n• الغيت حظره عام \n  ") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 
return false
end 

if MsgText[1] == "رتبتي" then return '** رتبتك ⇠ '..msg.TheRank..'\n' end

----------------- استقبال الرسائل ---------------
if MsgText[1] == "الغاء الامر" or MsgText[1] == "الغاء" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
redis:del(boss..'welcom:witting'..msg.chat_id_..msg.sender_user_id_,
boss..'rulse:witting'..msg.chat_id_..msg.sender_user_id_,
boss..'name:witting'..msg.chat_id_..msg.sender_user_id_,
boss..'about:witting'..msg.chat_id_..msg.sender_user_id_,
boss..'fwd:all'..msg.sender_user_id_,
boss..'fwd:pv'..msg.sender_user_id_,
boss..'fwd:groups'..msg.sender_user_id_,
boss..'namebot:witting'..msg.sender_user_id_,
boss..'addrd_all:'..msg.sender_user_id_,
boss..'delrd:'..msg.sender_user_id_,
boss..'addrd:'..msg.sender_user_id_,
boss..'delrdall:'..msg.sender_user_id_,
boss..'text_sudo:witting'..msg.sender_user_id_,
boss..":Witting_KleshaID"..msg.chat_id_..msg.sender_user_id_,
boss..":Witting_KleshaID_public"..msg.chat_id_..msg.sender_user_id_,
boss..":Witting_awamr_witting"..msg.chat_id_..msg.sender_user_id_,
boss..'addrd:'..msg.chat_id_..msg.sender_user_id_,
boss..':KStart:'..msg.chat_id_..msg.sender_user_id_,
boss.."WiCmdLink"..msg.chat_id_..msg.sender_user_id_,
boss..":uploadingsomeon:"..msg.chat_id_..msg.sender_user_id_,
boss..":uploadingsomeon2:"..msg.chat_id_..msg.sender_user_id_,
boss..":Witting_changeamr:"..msg.chat_id_..msg.sender_user_id_,
boss..":Witting_changeamr2:"..msg.chat_id_..msg.sender_user_id_,
boss..":Witting_MoveBot:"..msg.chat_id_..msg.sender_user_id_,
boss..":firstAmrOld:"..msg.chat_id_..msg.sender_user_id_,
boss..':prod_pin:'..msg.chat_id_..msg.sender_user_id_,
boss..":ForceSub:"..msg.sender_user_id_,
boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_,
boss..'addrdRandom1:'..msg.chat_id_..msg.sender_user_id_,
boss..'addrdRandom:'..msg.chat_id_..msg.sender_user_id_,
boss..'replay1Random'..msg.chat_id_..msg.sender_user_id_,
boss..'addrdRandom1:'..msg.sender_user_id_,
boss..'addrdRandom:'..msg.sender_user_id_,
boss..'replay1Random'..msg.sender_user_id_)
return '*من عيوني الغيته* \n'
end  

if (MsgText[1] == '/files' or MsgText[1]== "الملفات" or MsgText[1]== "الملفات" ) then
if not msg.SudoBase then return "• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
return All_File()
end   


if MsgText[1] == 'اصدار السورس' or MsgText[1] == 'الاصدار' then
return '• اصدار سورس كاسبر : *v'..version..'* \n'
end

if (MsgText[1] == 'تحديث السورس' or MsgText[1] == 'تحديث السورس ™') then
if not msg.SudoBase then return "• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
local GetVerison = 3.3 --https.request('https://th3bs.github.io/GetVersion.txt') or "0"
--GetVerison = GetVerison:gsub("\n",""):gsub(" ","")
if GetVerison > 3.3 then
UpdateSourceStart = true
sendMsg(msg.chat_id_,msg.id_,'*•* يوجد تحديث جديد الان \n*•* جاري تنزيل وتثبيت التحديث  ...')
redis:set(boss..":VERSION",GetVerison)
return false
else
return "• الاصدار الحالي : *v"..version.."* \n*•* لديـك احدث اصدار \n"
end
return false
end


if MsgText[1] == 'نسخه احتياطيه للمجموعات' then
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
return buck_up_groups(msg)
end 

if MsgText[1] == 'رفع نسخه الاحتياطيه' then
if not msg.SudoBase then return "• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessageDocument' then
local file_name = data.content_.document_.file_name_
if file_name:match('.json')then
if file_name:match('@[%a%d_]+.json') then
if file_name:lower():match('@[%a%d_]+') == Bot_User:lower() then 
io.popen("rm -f ../.telegram-cli/data/document/*")
local file_id = data.content_.document_.document_.id_ 
tdcli_function({ID = "DownloadFile",file_id_ = file_id},function(arg, data) 
if data.ID == "Ok" then
Uploaded_Groups_Ok = true
Uploaded_Groups_CH = arg.chat_id_
Uploaded_Groups_MS = arg.id_
print(Uploaded_Groups_CH)
print(Uploaded_Groups_MS)
sendMsg(arg.chat_id_,arg.id_,'*•* جاري رفع النسخه انتظر قليلا ... \n⌛️')
end
end,{chat_id_=arg.chat_id_,id_=arg.id_})
else 
sendMsg(arg.chat_id_,arg.id_,"*•* عذرا النسخه الاحتياطيه هذا ليست للبوت » ["..Bot_User.."]  \n❕")
end
else 
sendMsg(arg.chat_id_,arg.id_,'*•* عذرا اسم الملف غير مدعوم للنظام او لا يتوافق مع سورس كاسبر يرجى جلب الملف الاصلي الذي قمت بسحبه وبدون تعديل ع الاسم\n')
end  
else
sendMsg(arg.chat_id_,arg.id_,'*•* عذرا الملف ليس بصيغه Json !?\n❕')
end 
else
sendMsg(arg.chat_id_,arg.id_,'*•* عذرا هذا ليس ملف النسحه الاحتياطيه للمجموعات\n')
end 
end,{chat_id_=msg.chat_id_,id_=msg.id_})
else 
return "*•* ارسل ملف النسخه الاحتياطيه اولا\n*•* ثم قم بالرد على الملف وارسل \" `رفع نسخه الاحتياطيه` \" "
end 
return false
end

if (MsgText[1]=="تيست" or MsgText[1]=="test") then 
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
return "البوت شـغــال 🚀" 
end

if (MsgText[1]== "ايدي" or MsgText[1]=="ايدي") and msg.type == "pv" then return  "\n"..msg.sender_user_id_.."\n"  end

if MsgText[1]== "قناة السورس" and msg.type == "pv" then
local inline = {{{text="سسس",url="سسس"}}}
send_key(msg.sender_user_id_,'  [ييي](ييي)',nil,inline,msg.id_)
return false
end

if (MsgText[1]== "الاحصائيات" or MsgText[1]=="الاحصائيات") then
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
return 'الاحصائيات :  \n\n*•* عدد المجموعات المفعله : '..redis:scard(boss..'group:ids')..'\n*•* عدد المشتركين في البوت : '..redis:scard(boss..'users')..'\n'
end
---------------[End Function data] -----------------------
if MsgText[1]=="اضف رد عام" or MsgText[1]=="اضف رد عام" then
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
redis:setex(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_,300,true)
redis:del(boss..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
return "• تمام الحين ارسل كلمة الرد العام \n"
end

---------------[End Function data] -----------------------
if MsgText[1] == "تعيين كليشه الستارت" or MsgText[1] == "تعيين كليشة الستارت" or MsgText[1] == "تعيين كليشه الستارت" then
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
redis:setex(boss..':KStart:'..msg.chat_id_..msg.sender_user_id_,900,true)
return "• تمام الحين ارسل كليشة الستارت \n\n علما ان الاختصارات كالاتي : \n \n{الاسم} : لوضع اسم المستخدم\n{الايدي} : لوضع ايدي المستخدم\n{المعرف} : لوضع معرف المستخدم \n{الرتبه} : لوضع نوع رتبه المستخدم \n{البوت} : لاضهار اسم البوت \n{المطور} : لاضهار معرف Dev 🎖 ."
end
if MsgText[1] == "مسح كليشه الستارت" or MsgText[1] == "مسح كليشة الستارت" or MsgText[1] == "مسح كليشه الستارت" then
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
redis:del(boss..':Text_Start')
return "• تم مسح كليشه الستارت "
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود' then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
local names 	= redis:exists(boss..'replay:'..msg.chat_id_)
local photo 	= redis:exists(boss..'replay_photo:group:'..msg.chat_id_)
local voice 	= redis:exists(boss..'replay_voice:group:'..msg.chat_id_)
local imation   = redis:exists(boss..'replay_animation:group:'..msg.chat_id_)
local audio	 	= redis:exists(boss..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:exists(boss..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:exists(boss..'replay_video:group:'..msg.chat_id_)
if names or photo or voice or imation or audio or sticker or video then
redis:del(boss..'replay:'..msg.chat_id_,boss..'replay_photo:group:'..msg.chat_id_,boss..'replay_voice:group:'..msg.chat_id_,
boss..'replay_animation:group:'..msg.chat_id_,boss..'replay_audio:group:'..msg.chat_id_,boss..'replay_sticker:group:'..msg.chat_id_,boss..'replay_video:group:'..msg.chat_id_)
return "مسحت كل الردود 🚀"
else
return '*•* مافيه ردود عشان امسحها \n'
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود العامه' then
if not msg.SudoBase then return" للمطورين بس!" end
local names 	= redis:exists(boss..'replay:all')
local photo 	= redis:exists(boss..'replay_photo:group:')
local voice 	= redis:exists(boss..'replay_voice:group:')
local imation 	= redis:exists(boss..'replay_animation:group:')
local audio 	= redis:exists(boss..'replay_audio:group:')
local sticker 	= redis:exists(boss..'replay_sticker:group:')
local video 	= redis:exists(boss..'replay_video:group:')
if names or photo or voice or imation or audio or sticker or video then
redis:del(boss..'replay:all',boss..'replay_photo:group:',boss..'replay_voice:group:',boss..'replay_animation:group:',boss..'replay_audio:group:',boss..'replay_sticker:group:',boss..'replay_video:group:')
return " مسحت كل الردود العامه"
else
return "مافيه ردود عامه عشان امسحها ! "
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد عام' then
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
redis:set(boss..'delrdall:'..msg.sender_user_id_,true) 
return "• تمام عيني  \n• الحين ارسل الرد عشان امسحه من  المجموعات \n "
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد' then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
redis:set(boss..'delrd:'..msg.sender_user_id_,true)
return "• تمام عيني  \n• الحين ارسل الرد عشان امسحه \n"
end

if MsgText[1]== 'الردود' then

if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
local names  	= redis:hkeys(boss..'replay:'..msg.chat_id_)
local photo 	= redis:hkeys(boss..'replay_photo:group:'..msg.chat_id_)
local voice  	= redis:hkeys(boss..'replay_voice:group:'..msg.chat_id_)
local imation 	= redis:hkeys(boss..'replay_animation:group:'..msg.chat_id_)
local audio 	= redis:hkeys(boss..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:hkeys(boss..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:hkeys(boss..'replay_video:group:'..msg.chat_id_)
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '*•* مافيه ردود مضافه! \n' 
end
local ii = 1
local message = '*ردود المجموعة:*\n\n'
for i=1, #photo 	do message = message ..ii..' - *(* '..	Flter_Markdown(photo[i])..' *) ࿓  *( صوره 🏞 ) \n' 	 ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *(* '..	Flter_Markdown(names[i])..' *) ࿓  *( نص 🗯 ) \n'  	 ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *(* '..  Flter_Markdown(voice[i])..' *) ࿓  *( بصمه 🎙 ) \n' 	 ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *(* '..Flter_Markdown(imation[i])..' *) ࿓  *( متحركه 🎭 ) \n' ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *(* '..	Flter_Markdown(audio[i])..' *) ࿓  *( صوتيه 🔊 ) \n'  ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *(* '..Flter_Markdown(sticker[i])..' *) ࿓  *( ملصق 🗺 ) \n' 	 ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *(* '..	Flter_Markdown(video[i])..' *) ࿓  *( فيديو  🎞 ) \n' ii = ii + 1 end
message = message..'\n'
if utf8.len(message) > 4096 then
return "• مايمدي ارسل الردود بسبب القائمة كبيره مره ."
else
return message
end
end

if MsgText[1]== 'الردود العامه' or MsgText[1]=='الردود العامه' then
if not msg.SudoBase then return " للمطور بس! " end
local names 	= redis:hkeys(boss..'replay:all')
local photo 	= redis:hkeys(boss..'replay_photo:group:')
local voice 	= redis:hkeys(boss..'replay_voice:group:')
local imation 	= redis:hkeys(boss..'replay_animation:group:')
local audio 	= redis:hkeys(boss..'replay_audio:group:')
local sticker 	= redis:hkeys(boss..'replay_sticker:group:')
local video 	= redis:hkeys(boss..'replay_video:group:')
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '*•* مافيه ردود مضافه! \n' 
end
local ii = 1
local message = '*•* الردود العامه في البوت :   :\n\n'
for i=1, #photo 	do message = message ..ii..' - *(* '..	photo[i]..' *) ࿓ *( صوره 🏞 ) \n' 	ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *(* '..	names[i]..' *) ࿓ *( نص 🗯 ) \n'  	ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *(* '..	voice[i]..' *) ࿓ *( بصمه 🎙 ) \n' 	ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *(* '..imation[i]..' *) ࿓ *( متحركه 🎭 ) \n'ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *(* '..	audio[i]..' *) ࿓ *( صوتيه 🔊 ) \n' ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *(* '..sticker[i]..' *) ࿓ *( ملصق 🗺 ) \n' 	ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *(* '..	video[i]..' *) ࿓ *( فيديو  🎞 ) \n'ii = ii + 1 end
message = message..'\n➖➖➖'
if utf8.len(message) > 4096 then
return "• مايمدي ارسل الردود بسبب القائمة كبيره مره ."
else
return message
end
end
----=================================| كود الرد المتعدد المجموعات|===============================================
if MsgText[1]=="اضف رد متعدد" and msg.GroupActive then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
redis:setex(boss..'addrdRandom1:'..msg.chat_id_..msg.sender_user_id_,1400,true) 
redis:del(boss..'replay1Random'..msg.chat_id_..msg.sender_user_id_)
return "• تمام ,  الحين ارسل كلمة الرد المتعدد \n"
end


if MsgText[1]== "مسح رد متعدد" then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
redis:setex(boss..':DelrdRandom:'..msg.chat_id_..msg.sender_user_id_,300,true)
return "• تمام عيني  \n• الحين ارسل الرد المتعدد عشان امسحه \n "
end


if MsgText[1] == "مسح الردود المتعدده" or MsgText[1] == "مسح الردود المتعدده" then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  " end
local AlRdod = redis:smembers(boss..':KlmatRRandom:'..msg.chat_id_) 
if #AlRdod == 0 then return "*•* الردود المتعدده محذوفه من قبل \n" end
for k,v in pairs(AlRdod) do redis:del(boss..':ReplayRandom:'..msg.chat_id_..":"..v) redis:del(boss..':caption_replay:Random:'..msg.chat_id_..v) 
end
redis:del(boss..':KlmatRRandom:'..msg.chat_id_) 
return "*•* اهلًا عزيزي "..msg.TheRankCmd.."  \n*•* مسحت كل الردود المتعدده\n "
end

if MsgText[1] == "الردود المتعدده" or MsgText[1] == "الردود المتعدده" then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  " end
message = "*- الردود العشـوائيه:*\n\n"
local AlRdod = redis:smembers(boss..':KlmatRRandom:'..msg.chat_id_) 
if #AlRdod == 0 then 
message = message .."• مافيه ردود متعدده مضافه !\n"
else
for k,v in pairs(AlRdod) do
local incrr = redis:scard(boss..':ReplayRandom:'..msg.chat_id_..":"..v) 
message = message..k..'- ['..v..'] ⇠  (*'..incrr..'*)  ردود \n'
end
end
return message.."\n"
end
----=================================|نهايه كود الرد المتعدد المجموعات|===============================================

----=================================|كود الرد المتعدد العام|===============================================

if MsgText[1]=="اضف رد متعدد عام" then
if not msg.SudoUser then return "• هذا الامر يخص ( المطور ) بس  \n" end
redis:setex(boss..'addrdRandom1Public:'..msg.chat_id_..msg.sender_user_id_,1400,true) 
redis:del(boss..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_)
return "• تمام ,  الحين ارسل كلمة الرد للمتعدد العام \n "
end


if MsgText[1]== "مسح رد متعدد عام" then
if not msg.SudoUser then return "• هذا الامر يخص ( المطور ) بس  \n" end
redis:setex(boss..':DelrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_,300,true)
return "• تمام عيني  \n• الحين ارسل الرد المتعدد العام عشاان امسحه \n "
end

if MsgText[1] == "مسح الردود المتعدده العامه" then
if not msg.SudoUser then return "• هذا الامر يخص ( المطور ) بس  \n" end
local AlRdod = redis:smembers(boss..':KlmatRRandom:') 
if #AlRdod == 0 then return "*•* الردود المتعدده العامه محذوفه من قبل \n" end
for k,v in pairs(AlRdod) do redis:del(boss..":ReplayRandom:"..v) redis:del(boss..':caption_replay:Random:'..v)  end
redis:del(boss..':KlmatRRandom:') 
return "*•* أهلا عيني "..msg.TheRankCmd.."  \n*•* مسحت كل الردود المتعدده العامه \n "
end

if MsgText[1] == "الردود المتعدده العامه" then
if not msg.SudoUser then return "• هذا الامر يخص ( المطور ) بس  \n" end
message = "*- الردود العشـوائيه العامه:*\n\n"
local AlRdod = redis:smembers(boss..':KlmatRRandom:') 
if #AlRdod == 0 then 
message = message .."• مافيه ردود متعدده عامه مضافه !\n"
else
for k,v in pairs(AlRdod) do
local incrr = redis:scard(boss..":ReplayRandom:"..v) 
message = message..k..'- ['..v..'] ⇠ (*'..incrr..'*)  رد\n'
end
end
return message.."\n"
end

----=================================|نهايه كود الرد المتعدد العام|===============================================

if MsgText[1]=="اضف رد" and msg.GroupActive then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
redis:setex(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_,300,true) 
redis:del(boss..'replay1'..msg.chat_id_..msg.sender_user_id_)
return "• حلو , الحين ارسل الكلمة اللي تبيها \n"
end

if MsgText[1] == "ضع اسم للبوت" or MsgText[1]== 'ضع اسم للبوت' then
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
redis:setex(boss..'namebot:witting'..msg.sender_user_id_,300,true)
return"• تمام عيني  \n• الحين ارسل الاسم  للبوت \n "
end

if MsgText[1] == 'server' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
redisUsage=`redis-cli info | grep "used_memory_human" | sed "s/used_memory_human://g"`
redisDisk=`du -h /var/lib/redis/dump.rdb | sed "s/\/var\/lib\/redis\/dump.rdb//g"`
internet=`php /root/BOSS/inc/stat.php`

echo '📟 •⊱ { OS } ⊰•\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*🔖 •⊱ { Memory } ⊰•\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*💾 •⊱ { HardDisk } ⊰•\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*⚙️ •⊱ { CPU } ⊰•\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*🛰️l •⊱ { Network Usage } ⊰•\n*»» '"$internet"'*'
echo '*------------------------------\n*📦l •⊱ { Redis Usage } ⊰•\n*»» '"$redisUsage"'*'
echo '*------------------------------\n*💿l •⊱ { Redis Size } ⊰•\n*»» '"$redisDisk"'*'
echo '*------------------------------\n*📡 •⊱ { DataCenter } ⊰•\n*»» ]]..DataCenter..[[*'
echo '*------------------------------\n*👨🏾‍🔧 •⊱ { Whoami } ⊰•\n*»» '`whoami`'*'
echo '*------------------------------\n*🔌 •⊱ { Uptime } ⊰•  \n*»» '"$uptime"'*'
]]):read('*all')
end


if MsgText[1] == 'السيرفر' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
redisUsage=`redis-cli info | grep "used_memory_human" | sed "s/used_memory_human://g"`
redisDisk=`du -h /var/lib/redis/dump.rdb | sed "s/\/var\/lib\/redis\/dump.rdb//g"`
internet=`php /root/BOSS/inc/stat.php`

echo '📟l •⊱ { نظام التشغيل } ⊰•\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*🔖l •⊱ { الذاكره المتعدده } ⊰•\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*💾l •⊱ { وحـده الـتـخـزيـن } ⊰•\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*⚙️l •⊱ { الـمــعــالــج } ⊰•\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*🛰️l •⊱ { استخدام البيانات } ⊰•\n*»» '"$internet"'*'
echo '*------------------------------\n*📦l •⊱ { استخدام الريدز } ⊰•\n*»» '"$redisUsage"'*'
echo '*------------------------------\n*💿l •⊱ { حجم الريدز } ⊰•\n*»» '"$redisDisk"'*'
echo '*------------------------------\n*📡l •⊱ { موقـع الـسـيـرفـر } ⊰•\n*»» ]]..DataCenter..[[*'
echo '*------------------------------\n*👨🏾‍🔧l •⊱ { الــدخــول } ⊰•\n*»» '`whoami`'*'
echo '*------------------------------\n*🔌l •⊱ { مـده تـشغيـل الـسـيـرفـر } ⊰•  \n*»» '"$uptime"'*'
]]):read('*all')
end



if msg.type == 'channel' and msg.GroupActive then

if msg.SudoBase and (MsgText[1]=="م1" or MsgText[1]=="م2" or MsgText[1]=="م3" or MsgText[1]=="م المطور" or MsgText[1]=="اوامر الرد" or MsgText[1]=="الاوامر" or MsgText[1]=="اوامر الملفات") and redis:get(boss..":Witting_awamr_witting"..msg.chat_id_..msg.sender_user_id_) then 
redis:del(boss..":Witting_awamr_witting"..msg.chat_id_..msg.sender_user_id_)
redis:setex(boss..":changawmer:"..msg.chat_id_..msg.sender_user_id_,900,MsgText[1])
sendMsg(msg.chat_id_,msg.id_,"• حسننا لتعيين كليشة الـ *"..MsgText[1].."* \n• ارسل الكليشه الجديده الان \n\n علما يمكنك استخدام الاختصارات الاتي : \n \n{الاسم} : لوضع اسم المستخدم\n{الايدي} : لوضع ايدي المستخدم\n{المعرف} : لوضع معرف المستخدم \n{الرتبه} : لوضع نوع رتبه المستخدم \n{التفاعل} : لوضع تفاعل المستخدم \n{الرسائل} : لاضهار عدد الرسائل \n{المجوهرات} : لاضهار عدد المجوهرات \n{التعديل} : لاضهار عدد التكليجات \n{البوت} : لاضهار اسم البوت\n{المطور} : لاضهار معرف Dev 🎖\n➼")
return false
end



if MsgText[1] == "الاوامر" or MsgText[1] == "/Commands" or MsgText[1] == "/Commands@reecbot" then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
text = [[*• أهلًا بك عزيزي في اوامر البوت
 
 Dev 🎖 -* []]..SUDO_USER..[[]



]]
local inline = {{{text="م1",callback_data="/HelpList1"..msg.sender_user_id_},{text="م2",callback_data="/HelpList2"..msg.sender_user_id_}},{{text="م3",callback_data="/HelpList3"..msg.sender_user_id_}},{{text="الاغاني",callback_data="/HelpListDev"..msg.sender_user_id_},{text="التسليه",callback_data="/HelpListRrd"..msg.sender_user_id_}}} 
return send_inline(msg.chat_id_,text,inline,msg.id_)
end

--if MsgText[1] == "الاوامر" then
--if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس " end
--SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
--text = [[
--]]
--GetUserID(msg.sender_user_id_,function(arg,data)
--msg = arg.msg
--local textD = redis:get(boss..":awamer_Klesha_m:")
--if textD then
--textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
--else
--textD = text
--end
--sendMsg(msg.chat_id_,msg.id_,textD)
--end,{msg=msg})
--return false
--end

if MsgText[1]== 'م1' or MsgText[1]== 'م١' then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
local text = [[
Dev 🎖 - []]..SUDO_USER..[[]


*❨ اوامر الرفع والتنزيل ❩*

• رفع - تنزيل مشرف
• رفع - تنزيل مالك اساسي
• رفع - تنزيل مالك
• رفع - تنزيل مدير
• رفع - تنزيل ادمن
• رفع - تنزيل مميز
• تنزيل الكل  ↢ بالرد  ↢ لتنزيل الشخص من جميع رتبه
• تنزيل الكل  ↢ بدون رد  ↢ لتنزيل كل رتب المجموعة

*❨ اوامر المسح ❩*

• مسح المالكيين الاساسيين
• مسح المالكيين
• مسح المدراء
• مسح الادمنيه
• مسح المميزين
• مسح المحظورين
• مسح المكتومين
• مسح قائمة المنع
• مسح رتبه
• مسح الرتب
• مسح الردود
• مسح الاوامر
• مسح + العدد
• مسح بالرد
• مسح الترحيب
• مسح الرابط
• مسح قائمة التثبيت

*❨ اوامر الطرد الحظر الكتم ❩*

• حظر ↢ ❨ بالرد،بالمعرف،بالايدي ❩
• طرد ↢ ❨ بالرد،بالمعرف،بالايدي ❩
• كتم ↢ ❨ بالرد،بالمعرف،بالايدي ❩
• تقيد ↢ ❨ بالرد،بالمعرف،بالايدي ❩
• الغاء الحظر ↢ ❨ بالرد،بالمعرف،بالايدي ❩
• الغاء الكتم ↢ ❨ بالرد،بالمعرف،بالايدي ❩
• الغاء التقييد ↢ ❨ بالرد،بالمعرف،بالايدي ❩
• رفع القيود ↢ لحذف الكتم,الحظر,التقييد
• منع الكلمة
• منع بالرد على قيف او ستيكر
• الغاء منع الكلمة
• طرد البوتات
• طرد المحذوفين
• كشف البوتات

]]

GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_m1:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = text
end
sendMsg(msg.chat_id_,msg.id_,textD)
end,{msg=msg})
return false
end


if MsgText[1]== 'م2' then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
local text = [[
*Dev 🎖 -* []]..SUDO_USER..[[]

*❨ اوامر الوضع ❩*

• وضع ترحيب
• وضع قوانين
• وضع وصف
• وضع رابط
• اضف امر
• تغيير رتبه


*❨ اوامر رؤية الاعدادات ❩*

• المطورين
• المالكيين الاساسيين
• المالكيين 
• الادمنيه
• المدراء
• المميزين
• المحظورين
• القوانين
• قائمه المنع
• المكتومين
• المطور 
• معلوماتي 
• الحمايه  
• الوسائط
• الاعدادت
• المجموعه
• الساعه
• التاريخ]]

GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_m1:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = text
end
sendMsg(msg.chat_id_,msg.id_,textD)
end,{msg=msg})
return false
end


if MsgText[1]== 'م3' then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
local text = [[
*Dev 🎖 -* []]..SUDO_USER..[[]

*❨ اوامر الردود ❩*

• الردود ↢ تشوف كل الردود المضافه
• اضف رد ↢ عشان تضيف رد
• مسح رد ↢ عشان تمسح الرد
• مسح الردود ↢ تمسح كل الردود
• الردود المتعدده ↢ تشوف كل الردود المتعدده المضافه
• اضف رد متعدد ↢ عشان تضيف كلمة لها اكثر من رد
• مسح رد متعدد ↢ عشان تمسح رد متعدد
• مسح الردود المتعدده ↢ تمسح كل الردود المتعدده

*❨ اوامر القفل والفتح بالمسح ❩*

• قفل - فتح  التعديل  
• قفل - فتح  البصمات 
• قفل - فتح  الفيديو 
• قفل - فتح  الـصــور 
• قفل - فتح  الملصقات 
• قفل - فتح  الملفات  
• قفل - فتح  المتحركه 
• قفل - فتح  الدردشه 
• قفل - فتح  الروابط 
• قفل - فتح  الهاشتاق 
• قفل - فتح  البوتات 
• قفل - فتح  المعرفات 
• قفل - فتح  البوتات بالطرد 
• قفل - فتح  الاشعارات 
• قفل - فتح  الكلايش 
• قفل - فتح  التكرار 
• قفل - فتح  التوجيه 
• قفل - فتح  الانلاين 
• قفل - فتح  الجهات 
• قفل - فتح  الــكـــل 
• قفل - فتح  السب
• قفل - فتح  الفارسيه
• قفل - فتح  الانجليزيه
• قفل - فتح  الاضافه
• قفل - فتح  الصوت
• قفل - فتح  الالعاب
• قفل - فتح  الماركدوان
• قفل - فتح  الويب

*❨ اوامر الفتح والقفل بالتقييد ❩*

• قفل - فتح التوجيه بالتقييد 
• قفل - فتح الروابط بالتقييد 
• قفل - فتح المتحركه بالتقييد 
• قفل - فتح الصور بالتقييد 
• قفل - فتح الفيديو بالتقييد 

*❨ اوامر التفعيل والتعطيل ❩*

• تفعيل - تعطيل الترحيب 
• تفعيل - تعطيل الردود 
• تفعيل - تعطيل التحذير 
• تفعيل - تعطيل الايدي
• تفعيل - تعطيل الرابط
• تفعيل - تعطيل اطردني
• تفعيل - تعطيل الحظر
• تفعيل - تعطيل الحمايه
• تفعيل - تعطيل المنشن
• تفعيل - تعطيل الايدي بالصوره
• تفعيل - تعطيل التحقق 
• تفعيل - تعطيل ردود المطور 
• تفعيل - تعطيل التنظيف التلقائي
• تفعيل - تعطيل البايو 
• تفعيل - تعطيل انطق 
• تفعيل - تعطيل الترجمة 
• تفعيل - الردود المتعدده 

]]

GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_m1:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = text
end
sendMsg(msg.chat_id_,msg.id_,textD)
end,{msg=msg})
return false
end


if MsgText[1]== 'الساوند' or MsgText[1]== 'ساوند كلاود' or MsgText[1]== 'الساوند كلاود' then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username

local text = [[


✶ الساوند كلاود
- امر التشغيل ❨ *تفعيل الساوند* ❩
- امر التعطيل ❨ *تعطيل الساوند* ❩

✶ البـحث عن اغنية ↓

↞ *ساوند* اسم الاغنية

أو

↞ رابط الاغنية

「[Bac ](https://t.me/gccca)」 ]]

GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_m2:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = text
end
sendMsg(msg.chat_id_,msg.id_,textD)
end,{msg=msg})
return false
end

if MsgText[1]== 'اليوتيوب' then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username

local text = [[ 

✶ اليـوتيوب
- امر التشغيل ❨ *تفعيل اليوتيوب* ❩
- امر التعطيل ❨ *تعطيل اليوتيوب* ❩

✶ البـحث عن اغنية ↓
- *بحث* اسم الاغنية

أو

*yt* اسم الاغنية

أو

ترسل ( *تحميل صوت* )
بعدها ترسل اسم الاغنية او الرابط

ترسل ( *تحميل فيديو* )
بعدها ترسل اسم الاغنية او الرابط


「[Bac ](https://t.me/gccca)」 ]]


GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_m3:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = text
end
sendMsg(msg.chat_id_,msg.id_,textD)
end,{msg=msg})
return false
end

if MsgText[1]== 'التسليه' or MsgText[1]== 'اوامر التسليه' then
if not msg.Admin then return "• هذا الامر يخص ( الادمن,المدير,المالك,المطور ) بس  \n" end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username

local text = [[ 

*⦗ تفعيل التسليه ⦘*
*⦗ تعطيل التسليه ⦘*

🍰 • رفع - تنزيل كيكه
🍯 • رفع - تنزيل عسل
💩 • رفع - تنزيل زق
🦓 • رفع - تنزيل حمار
🐄 • رفع - تنزيل بقره
🐩 • رفع - تنزيل كلب
🐒 • رفع - تنزيل قرد
🐐 • رفع - تنزيل تيس
🐂 • رفع - تنزيل ثور
🏅 • رفع - تنزيل باعوص
🐓 • رفع - تنزيل دجاجه
🧱 • رفع - تنزيل هطف
🔫 • رفع - تنزيل صياد
🐏 • رفع - تنزيل خاروف
❤️ • رفع لقلبي - تنزيل من قلبي
👫 • زواج - طلاق

• قائمة الكيك
• قائمة العسل
• قائمة الزق
• قائمة الحمير
• قائمة البقر
• قائمة الكلاب
• قائمة القرود
• قائمة التيس
• قائمة الثور
• قائمة البواعيص
• قائمة الدجاج
• قائمة الهطوف
• قائمة الصيادين
• قائمة الخرفان

]]


GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_m3:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = text
end
sendMsg(msg.chat_id_,msg.id_,textD)
end,{msg=msg})
return false
end

if MsgText[1]== "م المطور" then
if not msg.SudoBase then return "• للمطور الاساسي بس  " end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username

local text = [[ ☑️ اهلا بك في قائمة اوامر المطورين
📨 Dev 🎖 - []]..SUDO_USER..[[]

• تفعيل
• تعطيل
• اسم بوتك + غادر
• مسح الادمنيه
• مسح المميزين
• مسح المدراء
• مسح المطورين
• مسح المنشئين
• مسح المنشئين الاساسيين
• مسح كلايش التعليمات
• اذاعه
• اذاعه خاص
• اذاعه عام
• اذاعه بالتثبيت
• اذاعه عام بالتوجيه
• تعيين قائمه الاوامر
• مسح كلايش التعليمات
• تعيين كليشه ستارت
• تعيين ايدي عام
• مسح ايدي عام
• تفعيل / تعطيل تعيين الايدي
• تحديث
• تحديث السورس ]]

GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_mtwr:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = text
end
sendMsg(msg.chat_id_,msg.id_,textD)
end,{msg=msg})
return false
end

if MsgText[1]== 'اوامر الرد' then
if not msg.Director then return "• هذا الامر يخص ( المطور,المالك,المدير ) بس  \n" end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username


local text = [[ ☑️ اهلا بك في قائمة اوامر الردود
📨 Dev 🎖 - []]..SUDO_USER..[[]

•  جميع اوامر الردود 
• الردود : لعرض الردود المثبته
•  اضف رد : لأضافه رد جديد
• مسح رد  الرد المراد مسحه
• مسح الردود : لمسح كل الردود
•  اضف رد عام : لاضافه رد لكل المجموعات
•  مسح رد عام : لمسح الرد العام 
• مسح الردود العامه : لمسح كل ردود العامه ]]

GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_mrd:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = text
end
sendMsg(msg.chat_id_,msg.id_,textD)
end,{msg=msg})
return false
end

if MsgText[1]== "اوامر الملفات" then
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
local text = [[ ☑️ اهلا بك في قائمة اوامر الملفات
📨 Dev 🎖 - []]..SUDO_USER..[[]

• آوآمر آلملفآت

•  `/files`  لعرض قائمه الملفات 
•  `/store`  لعرض متجر الملفات 
•  `sp file.lua`   تثبيت الملف 
•  `dp file.lua`  الملف المراد حذفه ]]


GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_mf:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = text
end
sendMsg(msg.chat_id_,msg.id_,textD)
end,{msg=msg})
return false
end


if MsgText[1] == "مغادره" or MsgText[1] == "ادفرني" or MsgText[1] == "احظرني" or MsgText[1] == "اطردني" then
if msg.Admin then return "*•* للاسف مااقدر اطرد المدراء والادمنيه والمالكيين  \n" end
if not redis:get(boss.."lock_leftgroup"..msg.chat_id_) then  return "*•* امر اطردني معطل!  \n" end
kick_user(msg.sender_user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
StatusLeft(msg.chat_id_,msg.sender_user_id_)
send_msg(msg.sender_user_id_,"• هلا بالنفسية , طردتك من المجموعه عشانك طلبت  \n• اذا كان ماقصدت او اذا تبي ترجع للمجموعة \n\n•  فهذا هو الرابط \n-"..Flter_Markdown(redis:get(boss..'group:name'..msg.chat_id_)).." :\n\n["..redis:get(boss..'linkGroup'..msg.chat_id_).."]\n")
sendMsg(msg.chat_id_,msg.id_,"• طردتك يانفسية , ارسلت لك الرابط خاص تقدر ترجع متى مابغيت يامعقد ")
else
sendMsg(msg.chat_id_,msg.id_,"• ما اقدر اطردك لانك مشرف في المجموعة  ")
end
end)
return false
end

end 



if MsgText[1] == "سورس" or MsgText[1]=="السورس" then
return [[
[Could .](t.me/MJJJ4)
 
[مطور السورس](https://t.me/gccca)
[Source Ted](https://t.me/o222b)

]]
end

if MsgText[1] == "متجر الملفات" or MsgText[1]:lower() == "/store"  then
if not msg.SudoBase then return "• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
local Get_Files, res = https.request("https://th3bs.github.io/GetFiles.json")
print(Get_Files)
print(res)
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
if Get_info then
local TextS = res.IinFormation.Text_Msg
local TextE = res.IinFormation.BorderBy
local NumFile = 0
for name,Course in pairs(res.Plugins) do
local Check_File_is_Found = io.open("plugins/"..name,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
CeckFile = "{✓}"
else
CeckFile = "{✖️}"
end
NumFile = NumFile + 1
TextS = TextS..NumFile.."- `"..name..'` » '..CeckFile..'\nl*»»* [{تفاصيل اكثر}]('..Course..")\n------------------------------------\n"
end
return TextS..TextE
else
return "• اوبس , هناك خطأ في مصفوفه الجيسون راسل مطور السورس ليتمكن من حل المشكله في اسرع وقت ممكن.!"
end
else
return "• اوبس , لا يوجد اتصال في الـapi راسل المطور ليتم حل المشكله في اسرع وقت ممكن.!"
end
return false
end

if MsgText[1]:lower() == "sp" and MsgText[2] then
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
local FileName = MsgText[2]:lower()
local Check_File_is_Found = io.open("plugins/"..FileName,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
TText = "• الملف موجود بالفعل \n• تم تحديث الملف  \n "
else
TText = "• تم تثبيت وتفعيل الملف بنجاح \n "
end
local Get_Files, res = https.request("https://raw.githubusercontent.com/TH3BS/th3bs.github.io/master/plugins/"..FileName)
if res == 200 then
print("DONLOADING_FROM_URL: "..FileName)
local FileD = io.open("plugins/"..FileName,'w+')
FileD:write(Get_Files)
FileD:close()
Start_Bot()

return TText
else
return "• مافيه ملف بهذا الاسم في المتجر \n✖️"
end
end

if MsgText[1]:lower() == "dp" and MsgText[2] then
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
local FileName = MsgText[2]:lower()
local Check_File_is_Found = io.open("plugins/"..FileName,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
os.execute("rm -fr plugins/"..FileName)
TText = "الملف ⇠ ["..FileName.."] \n• حذفته  \n"
else
TText = "الملف ⇠ ["..FileName.."] \n• محذوف من قبل  \n "
end
Start_Bot()
return TText
end

if MsgText[1] == "الساعه" then
return "\n• الـسـاعة الحين : "..os.date("%I:%M%p").."\n"
.."• الـتـاريـخ : "..os.date("%Y/%m/%d")
end

if MsgText[1] == "التاريخ" then
return "\n• الـتـاريـخ : "..os.date("%Y/%m/%d")
end

if MsgText[1] == "تفعيل الاشتراك الاجباري" then
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
if redis:get(boss..":UserNameChaneel") then
return "• اهلا عيني المطور \n• مفعل من قبل "
else
redis:setex(boss..":ForceSub:"..msg.sender_user_id_,350,true)
return "• اهلين فيك في نظام الاشتراك الاجباري\n• الحين ارسل معرف قـنـاتـك"
end
end

if MsgText[1] == "تعطيل الاشتراك الاجباري" then
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
local SubDel = redis:del(boss..":UserNameChaneel")
if SubDel == 1 then
return "• تم تعطيل الاشتراك الاجباري . \n"
else
return "• الاشتراك الاجباري بالفعل معطل . \n"
end
end

if MsgText[1] == "الاشتراك الاجباري" then
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
local UserChaneel = redis:get(boss..":UserNameChaneel")
if UserChaneel then
return "• اهلا عيني المطور \n• الاشتراك الاجباري للقناة : ["..UserChaneel.."]\n"
else
return "• مافيه قناة مفعله ع الاشتراك الاجباري. \n"
end
end

if MsgText[1] == "تغيير الاشتراك الاجباري" then
if not msg.SudoBase then return"• هذا الامر يخص ( Dev 🎖 ) بس  \n" end
redis:setex(boss..":ForceSub:"..msg.sender_user_id_,350,true)
return "• اهلين فيك في نظام الاشتراك الاجباري\n• الحين ارسل معرف قـنـاتـك"
end





end




local function dBoss(msg)

if msg.type == "pv" then 

if not msg.SudoUser then
local msg_pv = tonumber(redis:get(boss..'user:'..msg.sender_user_id_..':msgs') or 0)
if msg_pv > 5 then
redis:setex(boss..':mute_pv:'..msg.sender_user_id_,18000,true)   
return sendMsg(msg.chat_id_,0,'*•* حظرتك من البوت بسبب التكرار \n') 
end
redis:setex(boss..'user:'..msg.sender_user_id_..':msgs',2,msg_pv+1)
end

if msg.text=="/start" then

if msg.SudoBase then
local text = '• اهلا عيني المطور \n• انت Dev 🎖 هنا \n...\n\n• تقدر تتحكم بكل الاوامر الموجودة بالكيبورد\n• بس اضغط على الامر اللي تبيه ‏‏'

local keyboard = {
{"الاحصائيات"},
{"ضع اسم للبوت","ضع صوره للترحيب"},
{"تعطيل التواصل","تفعيل التواصل"},
{"تعطيل تعيين الايدي","تفعيل تعيين الايدي"},
{"تعطيل الاشتراك الاجباري","تفعيل الاشتراك الاجباري"},


{"تعطيل البوت خدمي","تفعيل البوت خدمي"},
{"مسح كليشه الستارت","تعيين كليشه الستارت"},
{"مسح كليشه الايدي عام","تعيين كليشه الايدي عام"},

{"اذاعه بالتثبيت","تعطيل الاذاعه","تفعيل الاذاعه"},
{"اذاعه","اذاعه عام","اذاعه خاص"},
{"الملفات","اذاعه عام بالتوجيه"},
{"نقل ملكيه البوت"},
{"تحديث ♻️","قائمه العام","قناة السورس"},
{"المطورين","ايدي"},
{"اضف رد عام","الردود العامه"},
{"تغيير الاشتراك الاجباري"},
{"الاشتراك الاجباري"},

{"تحديث السورس ™"},
{"الغاء الامر"}}
return send_key(msg.sender_user_id_,text,keyboard,nil,msg.id_)
else
redis:sadd(boss..'users',msg.sender_user_id_)
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
if SUDO_USER:match('@[%a%d_]+') then 
SUDO_USERR = "• مـعرف المطور  : "..SUDO_USER
else
SUDO_USERR = ""
end


text = [[*اهلًا بك عزيزي في بوت ]]..redis:get(boss..':NameBot:')..[[ 🧚*

• اختصاصي ادارة المجموعات من السبام والخ..
• كت تويت, يوتيوب , واشياء كثير ..
• عشان تفعلني ارفعني اشراف وارسل تفعيل.



]]
GetUserID(msg.sender_user_id_,function(arg,data)
if data.last_name_ then Name = data.first_name_ .." "..data.last_name_ else Name = data.first_name_ end
text = redis:get(boss..':Text_Start') or text
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local points = redis:get(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0
local Emsgs = redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if data.username_ then UserNameID = "@"..data.username_ else UserNameID = "مافيه" end  
text = text:gsub("{الاسم}",Name)
text = text:gsub("{الايدي}",msg.sender_user_id_)
text = text:gsub("{المعرف}",UserNameID)
text = text:gsub("{الرتبه}",msg.TheRank)
text = text:gsub("{البوت}",redis:get(boss..':NameBot:'))
text = text:gsub("{المطور}",SUDO_USER)
xsudouser = SUDO_USER:gsub('@','')
xsudouser = xsudouser:gsub([[\_]],'_')
--local inline = {{{text="ضيفني لـ مجموعتك 🧚",url="https://telegram.me/reecbot?startgroup=start"}}}
--send_key(msg.sender_user_id_,(text),nil,inline,msg.id_)
local inline = {{{text="ضيفني لـ مجموعتك 🧚",url="https://telegram.me/reecbot?startgroup=start"}},{{text="Dev 🎖",url="https://t.me/gccca"}}}
send_key(msg.sender_user_id_,(text),nil,inline,msg.id_)
end,nil)
return false
end
end

if msg.SudoBase then
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.forward_info_ then return false end
local FwdUser = data.forward_info_.sender_user_id_
local MSG_ID = (redis:get(boss.."USER_MSG_TWASEL"..data.forward_info_.date_) or 1)
msg = arg.msg
local SendOk = false
if data.content_.ID == "MessageDocument" then return false end
if msg.text then
sendMsg(FwdUser,MSG_ID,Flter_Markdown(msg.text))
SendOk = true
elseif msg.content_.ID == "MessageSticker" then
sendSticker(FwdUser,MSG_ID,msg.content_.sticker_.sticker_.persistent_id_,msg.content_.caption_ or '')
SendOk = true
elseif msg.content_.ID == "MessagePhoto" then
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
sendPhoto(FwdUser,MSG_ID,photo_id,msg.content_.caption_ or '')
SendOk = true
elseif msg.content_.ID == "MessageVoice" then
sendVoice(FwdUser,MSG_ID,msg.content_.voice_.voice_.persistent_id_,msg.content_.caption_ or '')
SendOk = true
elseif msg.content_.ID == "MessageAnimation" then
sendAnimation(FwdUser,MSG_ID,msg.content_.animation_.animation_.persistent_id_,msg.content_.caption_ or '')
SendOk = true
elseif msg.content_.ID == "MessageVideo" then
sendVideo(FwdUser,MSG_ID,msg.content_.video_.video_.persistent_id_,msg.content_.caption_ or '')
SendOk = true
elseif msg.content_.ID == "MessageAudio" then
sendAudio(FwdUser,MSG_ID,msg.content_.audio_.audio_.persistent_id_,msg.content_.caption_ or '')
SendOk = true
end
if SendOk then
GetUserID(FwdUser,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data,20) end
SendMention(arg.sender_user_id_,data.id_,arg.id_,"• ارسلت الرسالة \n• الى : "..USERNAME.." 🏌🏻",39,utf8.len(USERNAME)) 
end,{sender_user_id_=msg.sender_user_id_,id_=msg.id_})
end
end,{msg=msg})
end
else
if not redis:get(boss..'lock_twasel') then
if msg.forward_info_ or msg.content_.ID == "MessageSticker" or msg.content_.ID == "MessageUnsupported" or msg.content_.ID == "MessageDocument" then
return sendMsg(msg.chat_id_,msg.id_,"• معليش مايمديك ترسل ( ملف , توجيه‌‏ , مـلصـق , فديو كام ) ")
end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
if SUDO_USER:match('@[%a%d_]+') then 
SUDO_USERR = "\n🏌 "..SUDO_USER
else
SUDO_USERR = ""
end
redis:setex(boss.."USER_MSG_TWASEL"..msg.date_,43200,msg.id_)
sendMsg(msg.chat_id_,msg.id_,"ابشر رسالتك بتوصل للمطور ")
fwdMsg(SUDO_ID,msg.chat_id_,msg.id_)
return false
end
end
end
function CaptionInsert(msg,input,public)
if msg.content_ and msg.content_.caption_ then 
if public then
redis:hset(boss..':caption_replay:Random:'..msg.klma,input,msg.content_.caption_) 
else
redis:hset(boss..':caption_replay:Random:'..msg.chat_id_..msg.klma,input,msg.content_.caption_) 
end
end
end
--====================== Reply Only Group =====================================
if redis:get(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_) and redis:get(boss..'replay1'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(boss..'replay1'..msg.chat_id_..msg.sender_user_id_)
if msg.content_ and msg.content_.caption_ then redis:hset(boss..':caption_replay:'..msg.chat_id_,klma,msg.content_.caption_) end
if msg.text then 
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
if utf8.len(msg.text) > 4000 then 
return sendMsg(msg.chat_id_,msg.id_,"• معليش مو مسموح تضيف جواب الرد اكثر من 4000 حرف الغيت الامر\n")
end
redis:hset(boss..'replay:'..msg.chat_id_,klma,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'*( '..klma..' )*\n  واضفنا الرد ياحلو \n  ')
elseif msg.content_.ID == "MessagePhoto" then
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:hset(boss..'replay_photo:group:'..msg.chat_id_,klma,photo_id)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• اضفت الصورة للرد ياحلو \n• عشان تشوفها ارسل *( '..klma..' )* \n ')
elseif msg.content_.ID == "MessageVoice" then
redis:hset(boss..'replay_voice:group:'..msg.chat_id_,klma,msg.content_.voice_.voice_.persistent_id_)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• اضفت الفويس للرد ياحلو \n• عشان تسمعه ارسل *( '..klma..' )* \n')
elseif msg.content_.ID == "MessageAnimation" then
redis:hset(boss..'replay_animation:group:'..msg.chat_id_,klma,msg.content_.animation_.animation_.persistent_id_)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• اضفت المتحركه للرد ياحلو \n• عشان تشوفها ارسل *( '..klma..' )*  \n')
elseif msg.content_.ID == "MessageVideo" then
redis:hset(boss..'replay_video:group:'..msg.chat_id_,klma,msg.content_.video_.video_.persistent_id_)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• اضفت الفيديو للرد ياحلو \n• عشان تشوفه ارسل *( '..klma..' )* \n')
elseif msg.content_.ID == "MessageAudio" then
redis:hset(boss..'replay_audio:group:'..msg.chat_id_,klma,msg.content_.audio_.audio_.persistent_id_)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• اضفت الملف الصوتي للرد ياحلو \n• عشان تسمعه ارسل *( '..klma..' )*  \n')
elseif msg.content_.ID == "MessageSticker" then
redis:hset(boss..'replay_sticker:group:'..msg.chat_id_,klma,msg.content_.sticker_.sticker_.persistent_id_)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• اضفت الملصق للرد ياحلو \n• عشان تشوفه ارسل *( '..klma..' )*  \n')
end  

end
--================


--====================== Reply Random Public =====================================
if redis:get(boss..'addrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_) and redis:get(boss..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_) then
klma = redis:get(boss..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_)
msg.klma = klma
if msg.text == "تم" then
redis:del(boss..'addrdRandom1Public:'..msg.chat_id_..msg.sender_user_id_)
redis:del(boss..'addrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_)
sendMsg(msg.chat_id_,msg.id_,'• واضفنا الردود المتعدده العامه ياحلو \n• ارسل *('..klma..')* عشان تشوفها \n ')
redis:del(boss..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_)
return false
end

local CountRdod = redis:scard(boss..':ReplayRandom:'..klma) or 1
local CountRdod2 = 10 - tonumber(CountRdod)
local CountRdod = 9 - tonumber(CountRdod)
if CountRdod2 == 0 then 
redis:del(boss..'addrdRandom1Public:'..msg.chat_id_..msg.sender_user_id_)
redis:del(boss..'addrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_)
sendMsg(msg.chat_id_,msg.id_,'• وصلت الحد الاقصى لعدد الردود العامه \n• ارسل *('..klma..')* عشان تشوفها \n ')
redis:del(boss..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_)
return false
end
if msg.text then 
if utf8.len(msg.text) > 4000 then 
return sendMsg(msg.chat_id_,msg.id_,"• معليش مو مسموح تضيف جواب الرد اكثر من 4000 حرف الغيت الامر \n ")
end
CaptionInsert(msg,msg.text,true)
redis:sadd(boss..':KlmatRRandom:',klma) 
redis:sadd(boss..':ReplayRandom:'..klma,":Text:"..msg.text) 
return sendMsg(msg.chat_id_,msg.id_,'• وحطينا الرد العام باقي '..CountRdod..'\n• ارسل رد ثاني او ارسل (*تم*) \n ')
elseif msg.content_.ID == "MessagePhoto" then
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:sadd(boss..':KlmatRRandom:',klma) 
redis:sadd(boss..':ReplayRandom:'..klma,":Photo:"..photo_id) 
CaptionInsert(msg,photo_id,true)
return sendMsg(msg.chat_id_,msg.id_,'• وحطينا الصوره للرد العام باقي '..CountRdod..' \n• ارسل رد ثاني او ارسل (*تم*) \n')
elseif msg.content_.ID == "MessageVoice" then
redis:sadd(boss..':KlmatRRandom:',klma) 
redis:sadd(boss..':ReplayRandom:'..klma,":Voice:"..msg.content_.voice_.voice_.persistent_id_) 
CaptionInsert(msg,msg.content_.voice_.voice_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'• وحطينا البصمه للرد العام باقي '..CountRdod..' \n•  ارسل رد ثاني او ارسل (*تم*) \n')
elseif msg.content_.ID == "MessageAnimation" then
redis:sadd(boss..':KlmatRRandom:',klma) 
redis:sadd(boss..':ReplayRandom:'..klma,":Animation:"..msg.content_.animation_.animation_.persistent_id_) 
CaptionInsert(msg,msg.content_.animation_.animation_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'• وحطينا المتحركه للرد العام العام باقي '..CountRdod..' \n• ارسل رد ثاني او ارسل (*تم*) \n')
elseif msg.content_.ID == "MessageVideo" then
redis:sadd(boss..':KlmatRRandom:',klma) 
redis:sadd(boss..':ReplayRandom:'..klma,":Video:"..msg.content_.video_.video_.persistent_id_) 
CaptionInsert(msg,msg.content_.video_.video_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'• وحطينا الفيديو للرد العام باقي '..CountRdod..' \n• ارسل رد ثاني او ارسل (*تم*) \n')
elseif msg.content_.ID == "MessageAudio" then
redis:sadd(boss..':KlmatRRandom:',klma) 
redis:sadd(boss..':ReplayRandom:'..klma,":Audio:"..msg.content_.audio_.audio_.persistent_id_) 
CaptionInsert(msg,msg.content_.audio_.audio_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'• وحطينا الصوت للرد العام باقي '..CountRdod..' \n• ارسل رد ثاني او ارسل (*تم*) \n ')
elseif msg.content_.ID == "MessageDocument" then
redis:sadd(boss..':KlmatRRandom:',klma) 
redis:sadd(boss..':ReplayRandom:'..klma,":Document:"..msg.content_.document_.document_.persistent_id_) 
CaptionInsert(msg,msg.content_.document_.document_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'• وحطينا الملف للرد العام باقي '..CountRdod..' \n• ارسل رد ثاني او ارسل (*تم*) \n')  
elseif msg.content_.ID == "MessageSticker" then
redis:sadd(boss..':KlmatRRandom:',klma) 
redis:sadd(boss..':ReplayRandom:'..klma,":Sticker:"..msg.content_.sticker_.sticker_.persistent_id_) 
CaptionInsert(msg,msg.content_.sticker_.sticker_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'• وحطينا الملصق للرد العام باقي '..CountRdod..' \n• ارسل رد ثاني او ارسل (*تم*) \n ')
end  

end
--====================== End Reply Random Public =====================================
--====================== Reply Random Only Group =====================================
if redis:get(boss..'addrdRandom:'..msg.chat_id_..msg.sender_user_id_) and redis:get(boss..'replay1Random'..msg.chat_id_..msg.sender_user_id_) then
klma = redis:get(boss..'replay1Random'..msg.chat_id_..msg.sender_user_id_)
msg.klma = klma
if msg.text == "تم" then
redis:del(boss..'addrdRandom1:'..msg.chat_id_..msg.sender_user_id_)
redis:del(boss..'addrdRandom:'..msg.chat_id_..msg.sender_user_id_)
sendMsg(msg.chat_id_,msg.id_,'• واضفنا الردود المتعدده ياحلو \n• ارسل *('..klma..')* عشان تشوفها \n')
redis:del(boss..'replay1Random'..msg.chat_id_..msg.sender_user_id_)
return false
end

local CountRdod = redis:scard(boss..':ReplayRandom:'..msg.chat_id_..":"..klma) or 1
local CountRdod2 = 10 - tonumber(CountRdod)
local CountRdod = 9 - tonumber(CountRdod)
if CountRdod2 == 0 then 
redis:del(boss..'addrdRandom1:'..msg.chat_id_..msg.sender_user_id_)
redis:del(boss..'addrdRandom:'..msg.chat_id_..msg.sender_user_id_)
sendMsg(msg.chat_id_,msg.id_,'• وصلت الحد الاقصى لعدد الردود \n• ارسل *('..klma..')* عشان تشوفها \n')
redis:del(boss..'replay1Random'..msg.chat_id_..msg.sender_user_id_)
return false
end
if msg.text then 
if utf8.len(msg.text) > 4000 then 
return sendMsg(msg.chat_id_,msg.id_,"• معليش مو مسموح تضيف جواب الرد اكثر من 4000 حرف الغيت الامر\n ")
end
CaptionInsert(msg,msg.text,false)
redis:sadd(boss..':KlmatRRandom:'..msg.chat_id_,klma) 
redis:sadd(boss..':ReplayRandom:'..msg.chat_id_..":"..klma,":Text:"..msg.text) 
return sendMsg(msg.chat_id_,msg.id_,'• وحطينا الرد باقي '..CountRdod..'\n• ارسل رد ثاني او ارسل (*تم*) \n ')
elseif msg.content_.ID == "MessagePhoto" then
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:sadd(boss..':KlmatRRandom:'..msg.chat_id_,klma) 
redis:sadd(boss..':ReplayRandom:'..msg.chat_id_..":"..klma,":Photo:"..photo_id) 
CaptionInsert(msg,photo_id,false)
return sendMsg(msg.chat_id_,msg.id_,'• وحطينا صورة للرد باقي '..CountRdod..' \n• ارسل رد ثاني او ارسل (*تم*) \n ')
elseif msg.content_.ID == "MessageVoice" then
redis:sadd(boss..':KlmatRRandom:'..msg.chat_id_,klma) 
redis:sadd(boss..':ReplayRandom:'..msg.chat_id_..":"..klma,":Voice:"..msg.content_.voice_.voice_.persistent_id_) 
CaptionInsert(msg,msg.content_.voice_.voice_.persistent_id_,false)
return sendMsg(msg.chat_id_,msg.id_,'• وحطينا البصمه للرد باقي '..CountRdod..' \n• ارسل رد ثاني او ارسل (*تم*) \n')
elseif msg.content_.ID == "MessageAnimation" then
redis:sadd(boss..':KlmatRRandom:'..msg.chat_id_,klma) 
redis:sadd(boss..':ReplayRandom:'..msg.chat_id_..":"..klma,":Animation:"..msg.content_.animation_.animation_.persistent_id_) 
CaptionInsert(msg,msg.content_.animation_.animation_.persistent_id_,false)
return sendMsg(msg.chat_id_,msg.id_,'• وحطينا المتحركه للرد باقي '..CountRdod..' \n• ارسل رد ثاني او ارسل (*تم*) \n ')
elseif msg.content_.ID == "MessageVideo" then
redis:sadd(boss..':KlmatRRandom:'..msg.chat_id_,klma) 
redis:sadd(boss..':ReplayRandom:'..msg.chat_id_..":"..klma,":Video:"..msg.content_.video_.video_.persistent_id_) 
CaptionInsert(msg,msg.content_.video_.video_.persistent_id_,false)
return sendMsg(msg.chat_id_,msg.id_,'• وحطينا الفيديو للرد باقي '..CountRdod..' \n• ارسل رد ثاني او ارسل (*تم*) \n ')
elseif msg.content_.ID == "MessageAudio" then
redis:sadd(boss..':KlmatRRandom:'..msg.chat_id_,klma) 
redis:sadd(boss..':ReplayRandom:'..msg.chat_id_..":"..klma,":Audio:"..msg.content_.audio_.audio_.persistent_id_) 
CaptionInsert(msg,msg.content_.audio_.audio_.persistent_id_,false)
return sendMsg(msg.chat_id_,msg.id_,'• وحطينا الصوت للرد باقي '..CountRdod..' \n• ارسل رد ثاني او ارسل (*تم*) \n ')
elseif msg.content_.ID == "MessageDocument" then
redis:sadd(boss..':KlmatRRandom:'..msg.chat_id_,klma) 
redis:sadd(boss..':ReplayRandom:'..msg.chat_id_..":"..klma,":Document:"..msg.content_.document_.document_.persistent_id_) 
CaptionInsert(msg,msg.content_.document_.document_.persistent_id_,false)
return sendMsg(msg.chat_id_,msg.id_,'• وحطينا الملف للرد باقي '..CountRdod..' \n• ارسل رد ثاني او ارسل (*تم*) \n')  
elseif msg.content_.ID == "MessageSticker" then
redis:sadd(boss..':KlmatRRandom:'..msg.chat_id_,klma) 
redis:sadd(boss..':ReplayRandom:'..msg.chat_id_..":"..klma,":Sticker:"..msg.content_.sticker_.sticker_.persistent_id_) 
CaptionInsert(msg,msg.content_.sticker_.sticker_.persistent_id_,false)
return sendMsg(msg.chat_id_,msg.id_,'• وحطينا الملصق للرد باقي '..CountRdod..' \n• ارسل رد ثاني او ارسل (*تم*) \n ')
end  

end
--====================== End Reply Random Only Group =====================================
--====================== Reply Only Group =====================================
if redis:get(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) and redis:get(boss..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(boss..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
if msg.content_.caption_ then redis:hset(boss..':caption_replay:'..msg.chat_id_,klma,msg.content_.caption_) end
if msg.text then
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
if utf8.len(msg.text) > 4000 then 
return sendMsg(msg.chat_id_,msg.id_,"• مو مسموح تضيف جواب الرد باكثر من 4000 حرف تم الغاء الامر\n")
end
redis:hset(boss..'replay:all',klma,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  ابشر اضفت الرد ')
elseif msg.content_.ID == "MessagePhoto" then 
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:hset(boss..'replay_photo:group:',klma,photo_id)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• اضفت الصورة للرد \n• عشان تشوفها ارسل (['..klma..']) \n ')
elseif msg.content_.ID == "MessageVoice" then
redis:hset(boss..'replay_voice:group:',klma,msg.content_.voice_.voice_.persistent_id_)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• اضفت الفويس للرد \n• عشان تسمعه ارسل (['..klma..']) \n')
elseif msg.content_.ID == "MessageAnimation" then
redis:hset(boss..'replay_animation:group:',klma,msg.content_.animation_.animation_.persistent_id_)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• اضفت المتحركه للرد \n• عشان تشوفها ارسل (['..klma..'])  \n')
elseif msg.content_.ID == "MessageVideo" then
redis:hset(boss..'replay_video:group:',klma,msg.content_.video_.video_.persistent_id_)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• اضفت الفيديو للرد \n• عشان تشوفه ارسل (['..klma..']) \n ')
elseif msg.content_.ID == "MessageAudio" then
redis:hset(boss..'replay_audio:group:',klma,msg.content_.audio_.audio_.persistent_id_)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• اضفت الملف الصوتي للرد \n• عشان تسمعه ارسل (['..klma..'])  \n')
elseif msg.content_.ID == "MessageSticker" then
redis:hset(boss..'replay_sticker:group:',klma,msg.content_.sticker_.sticker_.persistent_id_)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'• اضفت الملصق للرد \n• عشان تشوفه ارسل (['..klma..'])  \n')
end  

end

if msg.text then
--====================== Requst UserName Of Channel For ForceSub ==============

if msg.Director and (msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]") or msg.text:match(".[Oo][Rr][Gg]")) and redis:get(boss.."WiCmdLink"..msg.chat_id_..msg.sender_user_id_) then 
redis:del(boss.."WiCmdLink"..msg.chat_id_..msg.sender_user_id_)
redis:set(boss..'linkGroup'..msg.chat_id_,msg.text)
sendMsg(msg.chat_id_,msg.id_,"• تم تعيين الرابط  ")
return false
end

if msg.Creator and redis:get(boss..":Witting_KleshaID_public"..msg.chat_id_..msg.sender_user_id_) then 
redis:del(boss..":Witting_KleshaID_public"..msg.chat_id_..msg.sender_user_id_)
redis:set(boss..":infoiduser_public:"..msg.chat_id_,msg.text)
sendMsg(msg.chat_id_,msg.id_,"• وسوينا كليشة الايدي \n• يمديك تجرب شكل الايدي الجديد الحين \n ")
return false
end

if msg.SuperCreator and redis:get(boss..":uploadingsomeon:"..msg.chat_id_..msg.sender_user_id_) then 

NameUser = redis:get(boss..":uploadingsomeon:"..msg.chat_id_..msg.sender_user_id_)
UserID = redis:get(boss..":uploadingsomeon2:"..msg.chat_id_..msg.sender_user_id_)
if not msg.text:match("[1234567]") and not msg.text:match("[*]") and not msg.text:match("[*][*]") then
redis:del(boss..":uploadingsomeon:"..msg.chat_id_..msg.sender_user_id_)
redis:del(boss..":uploadingsomeon2:"..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,"*•*الغيت الامر , لازم تحتوي رسالتك على ارقام الصلاحيات الموجودة  \n ")   
end

Nikname = msg.text:gsub("[1234567]","")
Nikname = Nikname:gsub("[*]","")
ResAdmin = UploadAdmin(msg.chat_id_,UserID,msg.text)  
if ResAdmin == '{"ok":false,"error_code":400,"description":"Bad Request: not enough rights"}' then
sendMsg(msg.chat_id_,msg.id_,"*•* ماعندي صلاحية رفع المشرفين في المجموعة! \n") 
elseif ResAdmin == '{"ok":false,"error_code":400,"description":"Bad Request: can\'t remove chat owner"}' then
sendMsg(msg.chat_id_,msg.id_,"*•* مايمديني اتحكم بصلاحيات المالك للمجموعة \n") 
elseif ResAdmin == '{"ok":false,"error_code":400,"description":"Bad Request: CHAT_ADMIN_REQUIRED"}' then
sendMsg(msg.chat_id_,msg.id_,"*•* معليش مايمديني اتحكم بصلاحيات مشرف مرفوع من مالك اخر \n") 
elseif ResAdmin == '{"ok":true,"result":true}' then
ChangeNikname(msg.chat_id_,UserID,Nikname)
redis:sadd(boss..'admins:'..msg.chat_id_,UserID)
local trues = "✓"
local falses = "✖️"

infochange = falses
infochange1 = falses
infochange2 = falses
infochange3 = falses
infochange4 = falses
infochange5 = falses
if msg.text:match(1) then
infochange = trues
end
if msg.text:match(2) then
infochange1 = trues
end
if msg.text:match(3) then
infochange2 = trues
end
if msg.text:match(4) then
infochange3 = trues
end
if msg.text:match(5) then
infochange4 = trues
end
if msg.text:match(6) then
infochange5 = trues
end
if msg.text:match("[*][*]") then
infochange = trues
infochange1 = trues
infochange2 = trues
infochange3 = trues
infochange4 = trues
infochange5 = trues
elseif msg.text:match("[*]") then
infochange = trues
infochange1 = trues
infochange2 = trues
infochange3 = trues
infochange4 = trues
end

if Nikname == "" then Nikname = "بدون" end
sendMsg(msg.chat_id_,msg.id_,"• المشرف「 "..NameUser.." 」 صلاحياته : \n\n"
.."• تغيير معلومات المجموعة : "..infochange.."\n"
.."• صلاحية حذف الرسائل : "..infochange1.."\n"
.."• صلاحية دعوه مستخدمين : "..infochange2.."\n"
.."• صلاحية حظر وتقييد المستخدمين : "..infochange3.."\n"
.."• صلاحية تثبيت الرسائل : "..infochange4.."\n"
.."• صلاحية رفع مشرفين اخرين : "..infochange5.."\n\n"
.."• اللقب : ["..Nikname.."]\n"
.."\n ") 
else
sendMsg(msg.chat_id_,msg.id_,"• المشرف 「 "..NameUser.." 」  حدث خطأ ما  \n") 
end
redis:del(boss..":uploadingsomeon:"..msg.chat_id_..msg.sender_user_id_)
redis:del(boss..":uploadingsomeon2:"..msg.chat_id_..msg.sender_user_id_)
return false
end


if msg.Creator and redis:get(boss..":changawmer:"..msg.chat_id_..msg.sender_user_id_) and not redis:get(boss..":Witting_awamr_witting"..msg.chat_id_..msg.sender_user_id_) then 
if msg.text=="م1" or msg.text=="م2" or msg.text=="م3" or msg.text=="م المطور" or msg.text=="اوامر الرد" or msg.text=="الاوامر" or msg.text=="اوامر الملفات" then return false end
local amr = redis:get(boss..":changawmer:"..msg.chat_id_..msg.sender_user_id_)
if amr == "م1" then
redis:set(boss..":awamer_Klesha_m1:",msg.text)
elseif amr == "م2" then
redis:set(boss..":awamer_Klesha_m2:",msg.text)
elseif amr == "م3" then
redis:set(boss..":awamer_Klesha_m3:",msg.text)
elseif amr == "م المطور" then
redis:set(boss..":awamer_Klesha_mtwr:",msg.text)
elseif amr == "اوامر الرد" then
redis:set(boss..":awamer_Klesha_mrd:",msg.text)
elseif amr == "اوامر الملفات" then
redis:set(boss..":awamer_Klesha_mf:",msg.text)
elseif amr == "الاوامر" then
redis:set(boss..":awamer_Klesha_m:",msg.text)
end
redis:del(boss..":changawmer:"..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,"• تم تعيين كليشة التعليمات  \n• يمديك تجرب الامر *{"..amr.."}* \n ")
end


if msg.SudoUser and redis:get(boss..":Witting_KleshaID"..msg.chat_id_..msg.sender_user_id_) then 
redis:del(boss..":Witting_KleshaID"..msg.chat_id_..msg.sender_user_id_)
redis:set(boss..":infoiduser",msg.text)
sendMsg(msg.chat_id_,msg.id_,"• تم تعيين كليشة الايدي  \n• يمديك تجرب الامر الحين \n ")
return false
end

--==========================================================================================================

if msg.Director and redis:get(boss..":Witting_changeamr:"..msg.chat_id_..msg.sender_user_id_) then
local Awammer 	= redis:hgetall(boss..":AwamerBotArray2:"..msg.chat_id_)
Amr = redis:get(boss..":Witting_changeamr:"..msg.chat_id_..msg.sender_user_id_)
local checknewamr = false
for k, Boss in pairs(XBoss) do 
local cceck,sec = Boss:gsub("[(]"..Amr.."[)]","("..msg.text..")")
if sec ~= 0 then
redis:hset(boss..":AwamerBotArray:"..msg.chat_id_,cceck,Boss)
redis:hset(boss..":AwamerBotArray2:"..msg.chat_id_,msg.text,Amr)
end
end  
for name,Course in pairs(Awammer) do
if name == msg.text then 
checknewamr = true 
end 
end
if checknewamr  then
sendMsg(msg.chat_id_,msg.id_,"*•* مايمديك تضيف امر مكرر بالقائمة! \n ")
else
redis:hset(boss..":AwamerBot:"..msg.chat_id_,msg.text,Amr)
sendMsg(msg.chat_id_,msg.id_,"• غيرت الامر القديم ["..Amr.."] \n• الى الامر الجديد ["..msg.text.."]\n ")
end
redis:del(boss..":Witting_changeamr:"..msg.chat_id_..msg.sender_user_id_)
return false
end

if msg.Director and not redis:get(boss..":Witting_changeamr2:"..msg.chat_id_..msg.sender_user_id_) and redis:get(boss..":firstAmrOld:"..msg.chat_id_..msg.sender_user_id_) then
local Awammer 	= redis:hgetall(boss..":AwamerBotArray2:"..msg.chat_id_)
local Amr = redis:get(boss..":firstAmrOld:"..msg.chat_id_..msg.sender_user_id_)

local checknewamr = false

for name,Course in pairs(Awammer) do if name == msg.text then checknewamr = true end end 
if checknewamr  then
sendMsg(msg.chat_id_,msg.id_,"*•* مايمديك تضيف امر مكرر بالقائمة! \n...")
else
for k, Boss in pairs(XBoss) do 
local cceck,sec = Boss:gsub("[(]"..Amr.."[)]","("..msg.text..")")
if sec ~= 0 then
redis:hset(boss..":AwamerBotArray:"..msg.chat_id_,cceck,Boss) 
redis:hset(boss..":AwamerBotArray2:"..msg.chat_id_,msg.text,Amr)
end
end 
redis:hset(boss..":AwamerBot:"..msg.chat_id_,msg.text,Amr)
sendMsg(msg.chat_id_,msg.id_,"• غيرت الامر القديم ["..Amr.."] \n• الى الامر الجديد ["..msg.text.."]\n ")
end
redis:del(boss..":firstAmrOld:"..msg.chat_id_..msg.sender_user_id_)
return false
end

if msg.Director and redis:get(boss..":Witting_changeamr2:"..msg.chat_id_..msg.sender_user_id_) then
local checkAmr = false
for k, Boss in pairs(XBoss) do if msg.text:match(Boss) then checkAmr = true end end      
if checkAmr then
sendMsg(msg.chat_id_,msg.id_,"• تمام عيني , عشان تغير امر (* "..msg.text.." *) \n• ارسل الامر الجديد الحين \n ")
redis:setex(boss..":firstAmrOld:"..msg.chat_id_..msg.sender_user_id_,900,msg.text)
else
sendMsg(msg.chat_id_,msg.id_,"*•* الامر مو موجود في البوت عشان تغييره  \n")
end
redis:del(boss..":Witting_changeamr2:"..msg.chat_id_..msg.sender_user_id_)
return false
end


if msg.Director and msg.text and redis:get(boss..":Witing_DelNewRtba:"..msg.chat_id_..msg.sender_user_id_) then 
redis:del(boss..":Witing_DelNewRtba:"..msg.chat_id_..msg.sender_user_id_)

if msg.text ~= "مطور اساسي" and msg.text ~= "مطور" and msg.text ~= "مالك اساسي" and msg.text ~= "مالك" and msg.text ~= "مدير" and msg.text ~= "ادمن" and msg.text ~= "مميز" then
sendMsg(msg.chat_id_,msg.id_,"معليش هذي الرتبه مو متوفره في البوت \n• الغيت الامر")
return false
end

if msg.text == "مطور اساسي" then
redis:del(boss..":RtbaNew1:"..msg.chat_id_)
elseif msg.text == "مطور" then
redis:del(boss..":RtbaNew2:"..msg.chat_id_)
elseif msg.text == "مالك اساسي" then
redis:del(boss..":RtbaNew3:"..msg.chat_id_)
elseif msg.text == "مالك" then
redis:del(boss..":RtbaNew4:"..msg.chat_id_)
elseif msg.text == "مدير" then
redis:del(boss..":RtbaNew5:"..msg.chat_id_)
elseif msg.text == "ادمن" then
redis:del(boss..":RtbaNew6:"..msg.chat_id_)
elseif msg.text == "مميز" then
redis:del(boss..":RtbaNew7:"..msg.chat_id_)
end

sendMsg(msg.chat_id_,msg.id_,"- حذفت الرتبه المضافه")
return false
end

if msg.SuperCreator and msg.text and redis:get(boss..":Witing_NewRtba:"..msg.chat_id_..msg.sender_user_id_) then 
redis:del(boss..":Witing_NewRtba:"..msg.chat_id_..msg.sender_user_id_)

if msg.text ~= "مطور اساسي" and msg.text ~= "مطور" and msg.text ~= "مالك اساسي" and msg.text ~= "مالك" and msg.text ~= "مدير" and msg.text ~= "ادمن" and msg.text ~= "مميز" then
sendMsg(msg.chat_id_,msg.id_,"معليش هذي الرتبه مو متوفره في البوت \n• الغيت الامر")
return false
end

redis:setex(boss..":Witting_NewRtba2:"..msg.chat_id_..msg.sender_user_id_,1000,msg.text)
sendMsg(msg.chat_id_,msg.id_,"- الحين ارسل الرتبه الجديده")
return false
end


if msg.SuperCreator and msg.text and redis:get(boss..":Witting_NewRtba2:"..msg.chat_id_..msg.sender_user_id_) then 


local rtbanamenew = redis:get(boss..":Witting_NewRtba2:"..msg.chat_id_..msg.sender_user_id_)
if rtbanamenew == "مطور اساسي" then
redis:set(boss..":RtbaNew1:"..msg.chat_id_,msg.text)
elseif rtbanamenew == "مطور" then
redis:set(boss..":RtbaNew2:"..msg.chat_id_,msg.text)
elseif rtbanamenew == "مالك اساسي" then
redis:set(boss..":RtbaNew3:"..msg.chat_id_,msg.text)
elseif rtbanamenew == "مالك" then
redis:set(boss..":RtbaNew4:"..msg.chat_id_,msg.text)
elseif rtbanamenew == "مدير" then
redis:set(boss..":RtbaNew5:"..msg.chat_id_,msg.text)
elseif rtbanamenew == "ادمن" then
redis:set(boss..":RtbaNew6:"..msg.chat_id_,msg.text)
elseif rtbanamenew == "مميز" then
redis:set(boss..":RtbaNew7:"..msg.chat_id_,msg.text)
end

redis:del(boss..":Witting_NewRtba2:"..msg.chat_id_..msg.sender_user_id_)
sendMsg(msg.chat_id_,msg.id_,"• تم غيرت الرتبه  \n\n  ["..rtbanamenew.."] ⇠ ["..msg.text.."]\n")
return false
end


if msg.Director and redis:get(boss..":Witting_AmrDel:"..msg.chat_id_..msg.sender_user_id_) then
local checkk = redis:hdel(boss..":AwamerBotArray2:"..msg.chat_id_,msg.text)

local AmrOld = redis:hgetall(boss..":AwamerBotArray:"..msg.chat_id_)
amrnew = ""
amrold = ""
amruser = msg.text.." @user"
amrid = msg.text.." 23434"
amrklma = msg.text.." ffffff"
amrfile = msg.text.." fff.lua"
for Amor,ik in pairs(AmrOld) do
if msg.text:match(Amor) then			
print("¦AMrnew : "..Amor,"¦AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
elseif amruser:match(Amor) then
print("¦AMrnew : "..Amor,"¦AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
elseif amrid:match(Amor) then
print("¦AMrnew : "..Amor,"¦AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
elseif amrklma:match(Amor) then
print("¦AMrnew : "..Amor,"¦AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
elseif amrfile:match(Amor) then
print("¦AMrnew : "..Amor,"¦AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
end
end

if checkk ~=0 then
tiires =  "• مسحت الامر (* "..msg.text.." *) من قائمة الاوامر \n "
else
tiires = "• هذا الامر مو موجود ضمن الاوامر المضافة  \n"
end
sendMsg(msg.chat_id_,msg.id_,tiires)
redis:del(boss..":Witting_AmrDel:"..msg.chat_id_..msg.sender_user_id_)
return false
end

--==========================================================================================================

if msg.Director and redis:get(boss..":Witting_AmrDel:"..msg.chat_id_..msg.sender_user_id_) then

local checkk = redis:hdel(boss..":AwamerBot:"..msg.chat_id_,msg.text)
if checkk ~=0 then
tiires =  "• مسحت امر (* "..msg.text.." *) من قائمة الاومر \n"
else
tiires = "• هذا الامر مو موجود ضمن الاوامر المضافة  \n"
end
sendMsg(msg.chat_id_,msg.id_,tiires)
redis:del(boss..":Witting_AmrDel:"..msg.chat_id_..msg.sender_user_id_)
return false
end


if msg.SudoBase and redis:get(boss..":Witting_MoveBot:"..msg.chat_id_..msg.sender_user_id_) then
if msg.text:match("^@[%a%d_]+$") then
GetUserName(msg.text,function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"*•* مافيه عضو بهذا اليوزر! \n") end 
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديني ارفع البوت! \n") end 
local UserID = data.id_
if UserID == our_id then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* مايمديني ارفع البوت! \n") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"*•* هييه هذا يوزر قناة مو حساب! \n") 
end
redis:set(boss..":SUDO_ID:",UserID)
local usero = arg.USERNAME:gsub([[\_]],"_")
redis:hset(boss..'username:'..UserID,'username',usero)
sendMsg(msg.chat_id_,msg.id_,"• تمت العملية بنجاح وتم تحويل ملكية البوت \n• الى الحساب الاتي : ["..arg.USERNAME:gsub([[\_]],"_").."]")
dofile("./inc/Run.lua")
print("Update Source And Reload ~ ./inc/Run.lua And change username sudo")
end,{ChatID=msg.chat_id_,MsgID=msg.id_,USERNAME=msg.text})

else
sendMsg(msg.chat_id_,msg.id_,"• معليش , فيه خطأ عندك \n• هذا مو معرف مستخدم ولا يحتوي على @  .")
end
redis:del(boss..":Witting_MoveBot:"..msg.chat_id_..msg.sender_user_id_)
return false 
end


if redis:get(boss..":ForceSub:"..msg.sender_user_id_) then
redis:del(boss..":ForceSub:"..msg.sender_user_id_)
if msg.text:match("^@[%a%d_]+$") then
local url , res = https.request(ApiToken..'/getchatmember?chat_id='..msg.text..'&user_id='..msg.sender_user_id_)
if res == 400 then
local Req = JSON.decode(url)
if Req.description == "Bad Request: chat not found" then 
sendMsg(msg.chat_id_,msg.id_,"• معليش , فيه خطأ عندك \n• المعرف الذي ارسلته ليس معرف قناة.")
return false
elseif Req.description == "Bad Request: user not found" then
sendMsg(msg.chat_id_,msg.id_,"• معليش , نسيت شي \n• لازم ترفع البوت مشرف في قناتك عشان تقدر تفعل الاشتراك الاجباري \n ")
elseif Req.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
sendMsg(msg.chat_id_,msg.id_,"• معليش , لقد نسيت شيئا \n• لازم ترفع البوت مشرف في قناتك عشان تقدر تفعل الاشتراك الاجباري \n ")
return false
end
else
redis:set(boss..":UserNameChaneel",msg.text)
sendMsg(msg.chat_id_,msg.id_,"• حلو , الان لقد تم تفعيل الاشتراك الاجباري\n• على قناتك : ["..msg.text.."]")
return false
end
else
sendMsg(msg.chat_id_,msg.id_,"• معليش , حبيبي المطور \n• هذا مو معرف قناة , حاول ثاني \n ")
return false
end
end

if redis:get(boss..'namebot:witting'..msg.sender_user_id_) then --- استقبال اسم البوت 
redis:del(boss..'namebot:witting'..msg.sender_user_id_)
redis:set(boss..':NameBot:',msg.text)
Start_Bot() 
sendMsg(msg.chat_id_,msg.id_,"• تم تغير اسم البوت  \n• الحين اسمه "..Flter_Markdown(msg.text).." \n ")
return false
end

if redis:get(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد لكل المجموعات
if not redis:get(boss..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال كلمه الرد لكل المجموعات
if utf8.len(msg.text) > 25 then 
return sendMsg(msg.chat_id_,msg.id_,"• معليش مو مسموح تضيف كلمة الرد باكثر من 25 حرف \n")
end
redis:hdel(boss..'replay_photo:group:',msg.text)
redis:hdel(boss..'replay_voice:group:',msg.text)
redis:hdel(boss..'replay_animation:group:',msg.text)
redis:hdel(boss..'replay_audio:group:',msg.text)
redis:hdel(boss..'replay_sticker:group:',msg.text)
redis:hdel(boss..'replay_video:group:',msg.text)
redis:setex(boss..'allreplay:'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"• حلو , يمديك الحين ترسل جواب الردالعام \n• [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]] \n ")
end
end

if redis:get(boss..':KStart:'..msg.chat_id_..msg.sender_user_id_) then
redis:del(boss..':KStart:'..msg.chat_id_..msg.sender_user_id_)
redis:set(boss..':Text_Start',msg.text)
return sendMsg(msg.chat_id_,msg.id_,'*•* تم اضافه كليشة الستارت بنجاح \n\n*•*ملاحظه : كليشة الستارت للمطور الاساسي تكون ثابته اما لغير الرتب تكون حسب الي وضعتها')
end


if redis:get(boss..'delrdall:'..msg.sender_user_id_) then
redis:del(boss..'delrdall:'..msg.sender_user_id_)
local names = redis:hget(boss..'replay:all',msg.text)
local photo =redis:hget(boss..'replay_photo:group:',msg.text)
local voice = redis:hget(boss..'replay_voice:group:',msg.text)
local animation = redis:hget(boss..'replay_animation:group:',msg.text)
local audio = redis:hget(boss..'replay_audio:group:',msg.text)
local sticker = redis:hget(boss..'replay_sticker:group:',msg.text)
local video = redis:hget(boss..'replay_video:group:',msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'*•* هذا الرد مو مضاف في قائمة الردود ')
else
redis:hdel(boss..'replay:all',msg.text)
redis:hdel(boss..'replay_photo:group:',msg.text)
redis:hdel(boss..'replay_voice:group:',msg.text)
redis:hdel(boss..'replay_audio:group:',msg.text)
redis:hdel(boss..'replay_animation:group:',msg.text)
redis:hdel(boss..'replay_sticker:group:',msg.text)
redis:hdel(boss..'replay_video:group:',msg.text)
return sendMsg(msg.chat_id_,msg.id_,'('..Flter_Markdown(msg.text)..')\n  مسحت الرد ')
end 
end 


if redis:get(boss..'text_sudo:witting'..msg.sender_user_id_) then -- استقبال كليشه المطور
redis:del(boss..'text_sudo:witting'..msg.sender_user_id_) 
redis:set(boss..':TEXT_SUDO',Flter_Markdown(msg.text))
return sendMsg(msg.chat_id_,msg.id_, "*•* تم وضع الكليشه بنجاح كلاتي 👋🏻\n\n*{*  "..Flter_Markdown(msg.text).."  *}*\n✓")
end
if redis:get(boss..'welcom:witting'..msg.chat_id_..msg.sender_user_id_) then -- استقبال كليشه الترحيب
redis:del(boss..'welcom:witting'..msg.chat_id_..msg.sender_user_id_) 
redis:set(boss..'welcome:msg'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"*•* تم وسوينا الترحيب يابعدي\n" )
end
if redis:get(boss..'rulse:witting'..msg.chat_id_..msg.sender_user_id_) then --- استقبال القوانين
redis:del(boss..'rulse:witting'..msg.chat_id_..msg.sender_user_id_) 
redis:set(boss..'rulse:msg'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'*•* اهلًا عزيزي\n• حفظت القوانين \n• ارسل [[ القوانين ]] عشان تشوفها \n')
end
if redis:get(boss..'name:witting'..msg.chat_id_..msg.sender_user_id_) then --- استقبال الاسم
redis:del(boss..'name:witting'..msg.chat_id_..msg.sender_user_id_) 
tdcli_function({ID= "ChangeChatTitle",chat_id_=msg.chat_id_,title_=msg.text},dl_cb,nil)
end
if redis:get(boss..'about:witting'..msg.chat_id_..msg.sender_user_id_) then --- استقبال الوصف
redis:del(boss..'about:witting'..msg.chat_id_..msg.sender_user_id_) 
tdcli_function({ID="ChangeChannelAbout",channel_id_=msg.chat_id_:gsub('-100',''),about_ = msg.text},function(arg,data) 
if data.ID == "Ok" then 
return sendMsg(msg.chat_id_,msg.id_,"*•* تم وحطينا الوصف ياحلو \n")
end 
end,nil)
end


if redis:get(boss..'fwd:all'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه عام
redis:del(boss..'fwd:all'..msg.sender_user_id_)
local pv = redis:smembers(boss..'users')  
local groups = redis:smembers(boss..'group:ids')
local allgp =  #pv + #groups
if allgp >= 300 then
sendMsg(msg.chat_id_,msg.id_,'• اهلا عيني المطور \n• جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
for i = 1, #pv do 
sendMsg(pv[i],0,Flter_Markdown(msg.text))
end
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text))
end
return sendMsg(msg.chat_id_,msg.id_,'*•* تم اذاعه الكليشه بنجاح \n*•* للمجموعات ⇠ *'..#groups..'* قروب \n*•* للمشتركين ⇠ '..#pv..' مشترك \n')
end

if redis:get(boss..'fwd:pv'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(boss..'fwd:pv'..msg.sender_user_id_)
local pv = redis:smembers(boss..'users')
if #pv >= 300 then
sendMsg(msg.chat_id_,msg.id_,'• اهلا عيني المطور \n• جاري نشر الرساله للمشتركين ...')			
end
local NumPvDel = 0
for i = 1, #pv do
sendMsg(pv[i],0,Flter_Markdown(msg.text))
end
sendMsg(msg.chat_id_,msg.id_,'*•* عدد المشتركين : '..#pv..'\n*•* تم الاذاعه بنجاح ') 
end

if redis:get(boss..':prod_pin:'..msg.chat_id_..msg.sender_user_id_) then 
redis:del(boss..':prod_pin:'..msg.chat_id_..msg.sender_user_id_)
local groups = redis:smembers(boss..'group:ids')
if #groups >= 300 then
sendMsg(msg.chat_id_,msg.id_,'• اهلا عيني المطور \n• جاري نشر الرساله للمجموعات ...')			
end
local NumGroupsDel = 0
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),function(arg,data)
if data.chat_id_ then redis:setex(boss..":propin"..data.chat_id_,100,data.content_.text_) end
end)
end
sendMsg(msg.chat_id_,msg.id_,'*•* عدد المجموعات •⊱ { *'..#groups..'*  } ⊰•\n*•* تـم الاذاعه بالتثبيت بنجاح ')
end 

if redis:get(boss..'fwd:groups'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(boss..'fwd:groups'..msg.sender_user_id_)
local groups = redis:smembers(boss..'group:ids')
if #groups >= 300 then
sendMsg(msg.chat_id_,msg.id_,'• اهلا عزيزي المطور \n• جاري نشر الرساله للمجموعات ...')			
end
local NumGroupsDel = 0
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text))
end
sendMsg(msg.chat_id_,msg.id_,'*•* عدد المجموعات •⊱ { *'..#groups..'*  } ⊰•\n*•* تـم الاذاعه بنجاح ')
end 
end 

if msg.forward_info_ and redis:get(boss..'fwd:'..msg.sender_user_id_) then
redis:del(boss..'fwd:'..msg.sender_user_id_)
local pv = redis:smembers(boss..'users')
local groups = redis:smembers(boss..'group:ids')
local allgp =  #pv + #groups
if allgp == 500 then
sendMsg(msg.chat_id_,msg.id_,'• اهلا عيني المطور \n• جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
local number = 0
for i = 1, #pv do 
fwdMsg(pv[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
for i = 1, #groups do 
fwdMsg(groups[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
return sendMsg(msg.chat_id_,msg.id_,'*•* تم اذاعه التوجيه بنجاح \n*•* للمجموعات ⇠ *'..#groups..'* \n*•* للخاص ⇠ '..#pv..'\n')			
end



if msg.text and msg.type == "channel" then
if msg.text:match("^"..Bot_Name.." اطلعي$") and (msg.SudoBase or msg.SuperCreator) then
sendMsg(msg.chat_id_,msg.id_,'ابشر') 
rem_data_group(msg.chat_id_)
StatusLeft(msg.chat_id_,our_id)
return false
end
end

if msg.content_.ID == "MessagePhoto" and redis:get(boss..'welcom_ph:witting'..msg.sender_user_id_) then
redis:del(boss..'welcom_ph:witting'..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:set(boss..':WELCOME_BOT',photo_id)
return sendMsg(msg.chat_id_,msg.id_,'• تم تغيير صورة‏‏ الترحيب للبوت \n')
end 

if msg.content_.ID == "MessagePhoto" and msg.type == "channel" and msg.GroupActive then
if redis:get(boss..'photo:group'..msg.chat_id_..msg.sender_user_id_) then
redis:del(boss..'photo:group'..msg.chat_id_..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_=msg.chat_id_,photo_=GetInputFile(photo_id)},function(arg,data)
if data.code_ == 3 then
sendMsg(arg.chat_id_,arg.id_,'• ماعندي صلاحيه تغيير الصوره \n• عطني صلاحيه `تغيير معلومات المجموعه ` ⠀\n✓')
end
end,{chat_id_=msg.chat_id_,id_=msg.id_})
return false
end
end

if not msg.GroupActive then return false end
if msg.text then
if redis:get(boss..'addrdRandom1:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد للمجموعه فقط

if not redis:get(boss..'replay1Random'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
if utf8.len(msg.text) > 25 then 
return sendMsg(msg.chat_id_,msg.id_,"• معليش مو مسموح تضيف اكثر من 25 حرف كلمة رد \n ")
end
redis:setex(boss..'addrdRandom:'..msg.chat_id_..msg.sender_user_id_,1400,true) 
redis:setex(boss..'replay1Random'..msg.chat_id_..msg.sender_user_id_,1400,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"• تمام , يمديك الحين ترسل جواب الرد المتعدد العام \n• ([ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]) \n• يمديك تضيف 10 ردود متعددة بس  \n  ")
end
end

if redis:get(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد للمجموعه بس

if not redis:get(boss..'replay1'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
if utf8.len(msg.text) > 25 then 
return sendMsg(msg.chat_id_,msg.id_,"• معليش مو مسموح تضيف كلمه الرد باكثر من 25 حرف \n")
end
redis:hdel(boss..'replay:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_video:group:'..msg.chat_id_,msg.text)
redis:setex(boss..'replay1'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"• حلو , الحين ارسل جواب الرد \n• ([ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]) \n  ")
end
end

if msg.text and redis:get(boss..':DelrdRandom:'..msg.chat_id_..msg.sender_user_id_) then
redis:del(boss..':DelrdRandom:'..msg.chat_id_..msg.sender_user_id_)
local DelRd = redis:del(boss..':ReplayRandom:'..msg.chat_id_..":"..msg.text) 
if DelRd == 0 then 
return sendMsg(msg.chat_id_,msg.id_,'*•* هذا الرد مو مضاف في قائمة الردود المتعدده ')
end
redis:del(boss..':caption_replay:Random:'..msg.chat_id_..msg.text) 
redis:srem(boss..':KlmatRRandom:'..msg.chat_id_,msg.text) 
return sendMsg(msg.chat_id_,msg.id_,'*•* ابشر حذفت الرد  \n')
end

if redis:get(boss..'delrd:'..msg.sender_user_id_) then
redis:del(boss..'delrd:'..msg.sender_user_id_)
local names 	= redis:hget(boss..'replay:'..msg.chat_id_,msg.text)
local photo 	= redis:hget(boss..'replay_photo:group:'..msg.chat_id_,msg.text)
local voice 	= redis:hget(boss..'replay_voice:group:'..msg.chat_id_,msg.text)
local animation = redis:hget(boss..'replay_animation:group:'..msg.chat_id_,msg.text)
local audio 	= redis:hget(boss..'replay_audio:group:'..msg.chat_id_,msg.text)
local sticker 	= redis:hget(boss..'replay_sticker:group:'..msg.chat_id_,msg.text)
local video 	= redis:hget(boss..'replay_video:group:'..msg.chat_id_,msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'*•* هذا الرد مو مضاف في قائمة الردود ')
else
redis:hdel(boss..'replay:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_video:group:'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'*( '..msg.text..' )* \n   ابشر مسحت الرد \n ')
end 
end

end

if msg.content_.ID == "MessagePinMessage" then
print(" -- pinned -- ")
local msg_pin_id = redis:get(boss..":MsgIDPin:"..msg.chat_id_)
if not msg.Director and not msg.OurBot and redis:get(boss..'lock_pin'..msg.chat_id_) then
if msg_pin_id then
print(" -- pinChannelMessage -- ")
tdcli_function({ID ="PinChannelMessage",
channel_id_ = msg.chat_id_:gsub('-100',''),
message_id_ = msg_pin_id,
disable_notification_ = 0},
function(arg,data)
if data.ID == "Ok" then
sendMsg(arg.chat_id_,arg.id_,"*•* معليش التثبيت مقفل من الاداره تم ارجاع التثبيت القديم\n")
end
end,{chat_id_=msg.chat_id_,id_=msg.id_})
else
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},
function(arg,data) 
if data.ID == "Ok" then
sendMsg(msg.chat_id_,msg.id_,"*•* معليش التثبيت مقفل من الاداره تم الغاء التثبيت\n ")      
end
end,{chat_id_=msg.chat_id_,id_=msg.id_})
end
return false
end
redis:set(boss..":MsgIDPin:"..msg.chat_id_,msg.id_)
end

if msg.content_.ID == "MessageChatChangePhoto" then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end
sendMsg(msg.chat_id_,msg.id_,"الحلو ["..UserName.."] غير صورة المجموعة \n")
end,{chat_id_=msg.chat_id_,id_=msg.id_})
end

if msg.content_.ID == "MessageChatChangeTitle" then
GetUserID(msg.sender_user_id_,function(arg,data)
redis:set(boss..'group:name'..arg.chat_id_,arg.title_)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end
sendMsg(arg.chat_id_,arg.id_,"• الحلو  ["..UserName.."]\n• غير اسم المجموعه \n• الى "..Flter_Markdown(msg.content_.title_).." \n ") 
end,{chat_id_=msg.chat_id_,id_=msg.id_,title_=msg.content_.title_})
end

if msg.content_.ID == "MessageChatAddMembers" and redis:get(boss..'welcome:get'..msg.chat_id_) then
local adduserx = tonumber(redis:get(boss..'user:'..msg.sender_user_id_..':msgs') or 0)
if adduserx > 3 then 
redis:del(boss..'welcome:get'..msg.chat_id_)
end
redis:setex(boss..'user:'..msg.sender_user_id_..':msgs',3,adduserx+1)
end

if (msg.content_.ID == "MessageChatAddMembers") then
if redis:get(boss..'welcome:get'..msg.chat_id_) then
if msg.adduserType then
welcome = (redis:get(boss..'welcome:msg'..msg.chat_id_) or "\nاهلًا عزيزي {الاسم}\nمعرفك {المعرف}\nوقت دخولك {الوقت}\nتاريخ دخولك {التاريخ}\nاسم المجموعة {المجموعه}\n\n - Dev 🎖 تواصل مع المالك ")
welcome = welcome:gsub("{القوانين}", redis:get(boss..'rulse:msg'..msg.chat_id_) or "• اهلًا عزيزي القوانين كالاتي: \n• ممنوع نشر الروابط \n• ممنوع التكلم او نشر صور اباحيه \n• ممنوع  اعاده توجيه\n• ممنوع العنصرية بكل انواعها \n• الرجاء احترام المدراء والادمنيه \n ")
if msg.addusername then UserName = '@'..msg.addusername else UserName = '< مافيه معرف >' end
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.adduser) or 0)
local points = redis:get(boss..':User_Points:'..msg.chat_id_..msg.adduser) or 0
local msgs = redis:get(boss..'msgs:'..msg.adduser..':'..msg.chat_id_) or 1

if msg.adduser == SUDO_ID then 
gtupe = 'Dev 🎖' 
elseif redis:sismember(boss..':SUDO_BOT:',msg.adduser) then 
gtupe = 'المطور'
elseif msg.GroupActive and redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,msg.adduser) then 
gtupe = 'المالك الاساسي'
elseif msg.GroupActive and redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,msg.adduser) then 
gtupe = 'المنشىء'
elseif msg.GroupActive and redis:sismember(boss..'owners:'..msg.chat_id_,msg.adduser) then 
gtupe = 'المدير' 
elseif msg.GroupActive and redis:sismember(boss..'admins:'..msg.chat_id_,msg.adduser) then 
gtupe = 'الادمن'
elseif msg.GroupActive and redis:sismember(boss..'whitelist:'..msg.chat_id_,msg.adduser) then 
gtupe = 'عضو مميز'
elseif msg.adduser == our_id then
gtupe = "بوت"
else
gtupe = 'بس عضو 🙍🏼‍♂️'
end
local url , res = https.request(ApiToken..'/getChat?chat_id='..msg.sender_user_id_)
if res == 200 then
local jsonn = JSON.decode(url)
bio = jsonn.result.bio
if jsonn.result.bio ~= nil then 
bio = '`'..bio..'`'
else
bio = 'لايوجد'
end
end

welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(boss..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",Flter_Markdown(UserName))
local welcome = welcome:gsub("{الايدي}",msg.adduser)
local welcome = welcome:gsub("{الرتبه}",gtupe)
local welcome = welcome:gsub("{التفاعل}",Get_Ttl(msgs))
local welcome = welcome:gsub("{الرسائل}",msgs)
local welcome = welcome:gsub("{المجوهرات}",points)
local welcome = welcome:gsub("{التعديل}",edited)
local welcome = welcome:gsub("{البوت}",Flter_Markdown(redis:get(boss..':NameBot:')))
local welcome = welcome:gsub("{المطور}",Flter_Markdown(SUDO_USER))
local welcome = welcome:gsub("{التاريخ}",os.date('%d/%m/%Y'))
local welcome = welcome:gsub("{الوقت}",os.date('%I:%M:%S'))
local welcome = welcome:gsub("{البايو}",bio)
local welcome = welcome:gsub("{بايو}",bio)
local welcome = welcome:gsub("{الاسم}",FlterName(msg.addname,20))
sendMsg(msg.chat_id_,msg.id_,welcome)
return false
end 
end 
end 

if (msg.content_.ID == "MessageChatJoinByLink") then
if redis:get(boss..'welcome:get'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
welcome = (redis:get(boss..'welcome:msg'..msg.chat_id_) or "\nاهلًا عزيزي {الاسم}\nمعرفك {المعرف}\nوقت دخولك {الوقت}\nتاريخ دخولك {التاريخ}\nاسم المجموعة {المجموعه}\n\n - Dev 🎖 تواصل مع المالك ")
welcome = welcome:gsub("{القوانين}", redis:get(boss..'rulse:msg'..msg.chat_id_) or "• اهلًا عزيزي القوانين كالاتي: \n• ممنوع نشر الروابط \n• ممنوع التكلم او نشر صور اباحيه \n• ممنوع  اعاده توجيه\n• ممنوع العنصرية بكل انواعها \n• الرجاء احترام المدراء والادمنيه ")
if data.username_ then UserName = '@'..data.username_ else UserName = '< لا يوجد معرف >' end
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local points = redis:get(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0
local msgs = redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
local url , res = https.request(ApiToken..'/getChat?chat_id='..msg.sender_user_id_)
if res == 200 then
local jsonn = JSON.decode(url)
bio = jsonn.result.bio
if jsonn.result.bio ~= nil then 
bio = '`'..bio..'`'
else
bio = 'لايوجد'
end
end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(boss..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",Flter_Markdown(UserName))
local welcome = welcome:gsub("{الايدي}",msg.sender_user_id_)
local welcome = welcome:gsub("{الرتبه}",msg.TheRank)
local welcome = welcome:gsub("{التفاعل}",Get_Ttl(msgs))
local welcome = welcome:gsub("{الرسائل}",msgs)
local welcome = welcome:gsub("{المجوهرات}",points)
local welcome = welcome:gsub("{التعديل}",edited)
local welcome = welcome:gsub("{البوت}",Flter_Markdown(redis:get(boss..':NameBot:')))
local welcome = welcome:gsub("{المطور}",Flter_Markdown(SUDO_USER))
local welcome = welcome:gsub("{التاريخ}",os.date('%d/%m/%Y'))
local welcome = welcome:gsub("{الوقت}",os.date('%I:%M:%S'))
local welcome = welcome:gsub("{البايو}",bio)
local welcome = welcome:gsub("{بايو}",bio)
local welcome = welcome:gsub("{الاسم}",FlterName(data.first_name_..' '..(data.last_name_ or "" ),20))
sendMsg(msg.chat_id_,msg.id_,welcome)
end)
end
return false
end

if msg.edited and not msg.SuperCreator and redis:get(boss.."antiedit"..msg.chat_id_) then 
if not msg.text then
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local usersmnc   = ""
local NameUser   = Hyper_Link_Name(data)
if data.username_  then uuseri = "\n• معرفه : @["..data.username_.."]"  else uuseri = "" end
local monsha = redis:smembers(boss..':MONSHA_Group:'..msg.chat_id_)
Rwers = ""
if msg.content_.ID == "MessagePhoto" then
Rwers = "صوره"
elseif msg.content_.ID == "MessageSticker"  then
Rwers = "ملصق"
elseif msg.content_.ID == "MessageVoice"  then
Rwers = "بصمه"
elseif msg.content_.ID == "MessageAudio"  then
Rwers = "صوت"
elseif msg.content_.ID == "MessageVideo"  then
Rwers = "فيديو"
elseif msg.content_.ID == "MessageAnimation"  then
Rwers = "متحركه"
else
Rwers = "نصي رابط"
end
if #monsha ~= 0 then 
for k,v in pairs(monsha) do
local info = redis:hgetall(boss..'username:'..v) if info and info.username and info.username:match("@[%a%d_]+") then usersmnc = usersmnc..info.username.." - " end
sendMsg(v,0,"• فيه شخص عدل \n• الاسم : ⇠「 "..NameUser.." 」 "..uuseri.."\n• الايدي : `"..msg.sender_user_id_.."`\n• رتبته : "..Getrtba(msg.sender_user_id_,msg.chat_id_).."\n• نوع التعديل : "..Rwers.."\n• المجموعة : "..Flter_Markdown((redis:get(boss..'group:name'..msg.chat_id_) or '')).."\n• الرابط : "..redis:get(boss..'linkGroup'..msg.chat_id_).." \n ")
end
end
return sendMsg(msg.chat_id_,msg.id_,"• المالكيين : ["..usersmnc.."] \n• فيه شخص عدل"..uuseri.."\n• الاسم : ⇠「 "..NameUser.." 」 \n• الايدي : `"..msg.sender_user_id_.."`\n• رتبته : "..Getrtba(msg.sender_user_id_,msg.chat_id_).."\n• نوع التعديل : "..Rwers.."\n ")   

end,{msg=msg})
Del_msg(msg.chat_id_,msg.id_)
end
if (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") 
or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.text:match(".[Pp][Ee]") 
or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.text:match("[Hh][Tt][Tt][Pp]://") 
or msg.text:match("[Ww][Ww][Ww].") 
or msg.text:match(".[Cc][Oo][Mm]")) 
then
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local usersmnc   = ""
local NameUser   = Hyper_Link_Name(data)
if data.username_  then uuseri = "\n• معرفه : @["..data.username_.."]"  else uuseri = "" end
local monsha = redis:smembers(boss..':MONSHA_Group:'..msg.chat_id_)

Rwers = "نصي رابط"

if #monsha ~= 0 then 
for k,v in pairs(monsha) do
local info = redis:hgetall(boss..'username:'..v) if info and info.username and info.username:match("@[%a%d_]+") then usersmnc = usersmnc..info.username.." - " end
sendMsg(v,0,"• فيه شخص عدل \n• الاسم : ⇠「 "..NameUser.." 」 "..uuseri.."\n• الايدي : `"..msg.sender_user_id_.."`\n• رتبته : "..Getrtba(msg.sender_user_id_,msg.chat_id_).."\n• نوع التعديل : "..Rwers.."\n• المجموعة : "..Flter_Markdown((redis:get(boss..'group:name'..msg.chat_id_) or '')).."\n• الرابط : "..redis:get(boss..'linkGroup'..msg.chat_id_).." \n ")
end
end
return sendMsg(msg.chat_id_,msg.id_,"• المالكيين : ["..usersmnc.."] \n• فيه شخص عدل "..uuseri.."\n• الاسم : ⋙「 "..NameUser.." 」 \n• الايدي : `"..msg.sender_user_id_.."`\n• رتبته : "..Getrtba(msg.sender_user_id_,msg.chat_id_).."\n• نوع التعديل : "..Rwers.."\n " )   

end,{msg=msg})
Del_msg(msg.chat_id_,msg.id_)
end
end



if not msg.Admin and not msg.Special then -- للاعضاء بس  

if not msg.forward_info_ and msg.content_.ID ~= "MessagePhoto" and redis:get(boss..'lock_flood'..msg.chat_id_)  then
local msgs = (redis:get(boss..'user:'..msg.sender_user_id_..':msgs') or 0)
local NUM_MSG_MAX = (redis:get(boss..'num_msg_max'..msg.chat_id_) or 5)
if tonumber(msgs) > tonumber(NUM_MSG_MAX) then 
redis:setex(boss..'sender:'..msg.sender_user_id_..':'..msg.chat_id_..'flood',30,true)
GetUserID(msg.sender_user_id_,function(arg,datau)
Restrict(arg.chat_id_,arg.sender_user_id_,1)
if datau.username_ then USERNAME = '@'..datau.username_ else USERNAME = FlterName(datau.first_name_..' '..(datau.last_name_ or "")) end
SendMention(arg.chat_id_,datau.id_,arg.id_,"*• العضو  "..USERNAME.."\n• تراك ابثرتنا وارسلت اكثر من "..arg.NUM_MSG_MAX.." رسايل  عشان كذا قيدناك يابثر‌‏‌‏* \n ",12,utf8.len(USERNAME)) 
end,{chat_id_=msg.chat_id_,id_=msg.id_,NUM_MSG_MAX=NUM_MSG_MAX,sender_user_id_=msg.sender_user_id_})
return false
end 
redis:setex(boss..'user:'..msg.sender_user_id_..':msgs',2,msgs+1)
end


if msg.forward_info_ then
if redis:get(boss..'mute_forward'..msg.chat_id_) then -- قفل التوجيه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd \27[0m")

if data.ID == "Error" and data.code_ == 6 then 
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة \n*•* مو مشرف او ماعندي صلاحية الحذف \n ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) and not redis:get(boss..':User_Fwd_Msg:'..msg.sender_user_id_..':flood') then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع اعادة التوجيه!  \n",12,utf8.len(USERNAME)) 
return redis:setex(boss..':User_Fwd_Msg:'..msg.sender_user_id_..':flood',15,true)
end,nil)
end
end)
return false
elseif redis:get(boss..':tqeed_fwd:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd tqeed \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false 
end
elseif msg.edited and msg.content_.ID ~= "MessageText" and redis:get(boss..'lock_edit'..msg.chat_id_) then -- قفل التعديل
Del_msg(msg.chat_id_,msg.id_,function(arg,data) 
print("\27[1;31m Msg Del becuse send Edit \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• معليش ممنوع التعديل تم المسح \n ",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif tonumber(msg.via_bot_user_id_) ~= 0 and redis:get(boss..'mute_inline'..msg.chat_id_) then -- قفل الانلاين
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send inline \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة \n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• الانلاين مقفول!  \n",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.text then -- رسايل بس
if utf8.len(msg.text) > 500 and redis:get(boss..'lock_spam'..msg.chat_id_) then -- قفل الكليشه 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send long msg \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل الكليشه!  \n",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") 
or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.text:match(".[Pp][Ee]") 
or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.text:match("[Hh][Tt][Tt][Pp]://") 
or msg.text:match("[Ww][Ww][Ww].") 
or msg.text:match(".[Cc][Oo][Mm]")) 
and redis:get(boss..':tqeed_link:'..msg.chat_id_)  then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user i restricted becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرساله المخالفة \n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false
elseif(msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Oo][Rr][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match(".[Pp][Ee]")) 
and redis:get(boss..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل روابط!  \n",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif (msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]") or msg.text:match(".[Tt][Kk]") or msg.text:match(".[Mm][Ll]") or msg.text:match(".[Oo][Rr][Gg]")) and redis:get(boss..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل روابط الويب!   \n ",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif (msg.text:match("ه‍") or msg.text:match("ی") or msg.text:match("ک")) and redis:get(boss.."lock_pharsi"..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send lock_pharsi \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل باللغة الفارسيه!  \n ",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif 10 > 60 then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send mseeea \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل كلمات مسيئة!  \n ",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.text:match("[a-zA-Z]") and redis:get(boss.."lock_lang"..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send En \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل باللغة الانجليزية!  \n",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.text:match("#.+") and redis:get(boss..'lock_tag'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send tag \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع التاق!  \n",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.text:match("@[%a%d_]+")  and redis:get(boss..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل معرفات!   \n",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif not msg.textEntityTypeBold and (msg.textEntityTypeBold or msg.textEntityTypeItalic) and redis:get(boss..'lock_markdown'..msg.chat_id_) then 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send markdown \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل الماركدوان! \n",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.textEntityTypeTextUrl and redis:get(boss..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web page \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل روابط الويب!  \n",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
end 
elseif msg.content_.ID == "MessageUnsupported" and redis:get(boss..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل فيديو كام! \n",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.content_.ID == "MessagePhoto" then
if redis:get(boss..'mute_photo'..msg.chat_id_)  then -- قفل الصور
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل صور!  \n",12,utf8.len(USERNAME))
end,nil)
end
end)
return false
elseif redis:get(boss..':tqeed_photo:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user resctricted becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.content_.ID == "MessageVideo" then
if redis:get(boss..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send vedio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل فيديو!  \n",12,utf8.len(USERNAME)) 
end,nil)   
end
end)
return false
elseif redis:get(boss..':tqeed_video:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.content_.ID == "MessageDocument" and redis:get(boss..'mute_document'..msg.chat_id_) then -- قفل الملفات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send file \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل ملفات!  \n",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.content_.ID == "MessageSticker" and redis:get(boss..'mute_sticker'..msg.chat_id_) then --قفل الملصقات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send sticker \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل الملصقات!  \n",12,utf8.len(USERNAME)) 
end,nil)   
end
end)
return false
elseif msg.content_.ID == "MessageAnimation" then
if redis:get(boss..'mute_gif'..msg.chat_id_) then -- قفل المتحركه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل الصور المتحركة!  \n",12,utf8.len(USERNAME)) 
end,nil)   
end
end)
return false
elseif redis:get(boss..':tqeed_gif:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.content_.ID == "MessageContact" and redis:get(boss..'mute_contact'..msg.chat_id_) then -- قفل الجهات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Contact \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME..'\n• ممنوع ترسل جهات الاتصال!  \n ',12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.content_.ID == "MessageLocation" and redis:get(boss..'mute_location'..msg.chat_id_) then -- قفل الموقع
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send location \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل الموقع!  \n ",12,utf8.len(USERNAME))
end,nil)
end
end)
return false
elseif msg.content_.ID == "MessageVoice" and redis:get(boss..'mute_voice'..msg.chat_id_) then -- قفل البصمات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send voice \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل البصمات!  \n ",12,utf8.len(USERNAME))
end,nil)   
end
end)
return false
elseif msg.content_.ID == "MessageGame" and redis:get(boss..'mute_game'..msg.chat_id_) then -- قفل الالعاب
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send game \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع لعب الالعاب!  \n ",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.content_.ID == "MessageAudio" and redis:get(boss..'mute_audio'..msg.chat_id_) then -- قفل الصوت
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send audio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل الصوت!  \n ",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.reply_markup and  msg.reply_markup.ID == "replyMarkupInlineKeyboard" and redis:get(boss..'mute_keyboard'..msg.chat_id_) then -- كيبورد
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send keyboard \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• معليش الكيبورد مقفول  \n ",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
end

if msg.content_.caption_ then -- الرسايل الي بالكابشن
if (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.content_.caption_:match("[Tt].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match(".[Pp][Ee]")) 
and redis:get(boss..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل الروابط!  \n ",12,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif (msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") 
or msg.content_.caption_:match("[Ww][Ww][Ww].") 
or msg.content_.caption_:match(".[Cc][Oo][Mm]")) 
and redis:get(boss..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send webpage caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل روابط الويب!  \n",12,utf8.len(USERNAME))
end,nil)
end
end)
return false
elseif msg.content_.caption_:match("@[%a%d_]+") and redis:get(boss..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'*•* مايمديني امسح الرسالة المخالفة\n*•* مو مشرف او ماعندي صلاحية الحذف \n')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"• العضو  "..USERNAME.."\n• ممنوع ترسل التاق او المعرف!  \n ",12,utf8.len(USERNAME))
end,nil)
end 
end)
return false
end 


end --========{ End if } ======

end 
SaveNumMsg(msg)
------------------------------{ Start Replay Send }------------------------

if msg.text then

GetUserID(msg.sender_user_id_,function(arg,data)
local Replay = false
msg = arg.msg
if redis:get(boss.."lock_RandomRdod"..msg.chat_id_) then 
local Replay = 0
Replay = redis:smembers(boss..':ReplayRandom:'..msg.text) 
if #Replay ~= 0 then 
local Replay = Replay[math.random(#Replay)]
Replay = convert_Klmat(msg,data,Replay,true)
local CaptionFilter = Replay:gsub(":Text:",""):gsub(":Document:",""):gsub(":Voice:",""):gsub(":Photo:",""):gsub(":Animation:",""):gsub(":Audio:",""):gsub(":Sticker:",""):gsub(":Video:","")
Caption = redis:hget(boss..':caption_replay:Random:'..msg.text,CaptionFilter)
Caption = convert_Klmat(msg,data,Caption)
if Replay:match(":Text:") then
return sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Replay:gsub(":Text:","")))
elseif Replay:match(":Document:") then 
return sendDocument(msg.chat_id_,msg.id_,Replay:gsub(":Document:",""),Caption)  
elseif Replay:match(":Photo:") then 
return sendPhoto(msg.chat_id_,msg.id_,Replay:gsub(":Photo:",""),Caption)  
elseif Replay:match(":Voice:") then 
return sendVoice(msg.chat_id_,msg.id_,Replay:gsub(":Voice:",""),Caption)
elseif Replay:match(":Animation:") then 
return sendAnimation(msg.chat_id_,msg.id_,Replay:gsub(":Animation:",""),Caption)  
elseif Replay:match(":Audio:") then 
return sendAudio(msg.chat_id_,msg.id_,Replay:gsub(":Audio:",""),"",Caption)  
elseif Replay:match(":Sticker:") then 
return sendSticker(msg.chat_id_,msg.id_,Replay:gsub(":Sticker:",""))  
elseif Replay:match(":Video:") then 
return sendVideo(msg.chat_id_,msg.id_,Replay:gsub(":Video:",""),Caption)
end
end


local Replay = 0
Replay = redis:smembers(boss..':ReplayRandom:'..msg.chat_id_..":"..msg.text) 
if #Replay ~= 0 then 
local Replay = Replay[math.random(#Replay)]
Replay = convert_Klmat(msg,data,Replay,true)
local CaptionFilter = Replay:gsub(":Text:",""):gsub(":Document:",""):gsub(":Voice:",""):gsub(":Photo:",""):gsub(":Animation:",""):gsub(":Audio:",""):gsub(":Sticker:",""):gsub(":Video:","")
Caption = redis:hget(boss..':caption_replay:Random:'..msg.chat_id_..msg.text,CaptionFilter)
Caption = convert_Klmat(msg,data,Caption)
if Replay:match(":Text:") then
return sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Replay:gsub(":Text:","")))
elseif Replay:match(":Document:") then 
return sendDocument(msg.chat_id_,msg.id_,Replay:gsub(":Document:",""),Caption)  
elseif Replay:match(":Photo:") then 
return sendPhoto(msg.chat_id_,msg.id_,Replay:gsub(":Photo:",""),Caption)  
elseif Replay:match(":Voice:") then 
return sendVoice(msg.chat_id_,msg.id_,Replay:gsub(":Voice:",""),Caption)
elseif Replay:match(":Animation:") then 
return sendAnimation(msg.chat_id_,msg.id_,Replay:gsub(":Animation:",""),Caption)  
elseif Replay:match(":Audio:") then 
return sendAudio(msg.chat_id_,msg.id_,Replay:gsub(":Audio:",""),"",Caption)  
elseif Replay:match(":Sticker:") then 
return sendSticker(msg.chat_id_,msg.id_,Replay:gsub(":Sticker:",""))  
elseif Replay:match(":Video:") then 
return sendVideo(msg.chat_id_,msg.id_,Replay:gsub(":Video:",""),Caption)
end
end

end

Replay = redis:hget(boss..'replay:all',msg.text)
if Replay and redis:get(boss.."lock_rdodSource"..msg.chat_id_) then
Replay = convert_Klmat(msg,data,Replay,true)
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Replay))
return false
end

Replay = redis:hget(boss..'replay:'..msg.chat_id_,msg.text)
if Replay and redis:get(boss..'replay'..msg.chat_id_) then 
Replay = convert_Klmat(msg,data,Replay,true)
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Replay)) 
return false
end

Replay = redis:hget(boss..'replay_photo:group:',msg.text)
if Replay and redis:get(boss.."lock_rdodSource"..msg.chat_id_) then 
Caption = redis:hget(boss..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
print(Caption)
sendPhoto(msg.chat_id_,msg.id_,Replay,Caption)  
return false
end

Replay = redis:hget(boss..'replay_voice:group:',msg.text)
if Replay and redis:get(boss.."lock_rdodSource"..msg.chat_id_) then 
Caption = redis:hget(boss..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendVoice(msg.chat_id_,msg.id_,Replay,Caption)
return false
end

Replay = redis:hget(boss..'replay_animation:group:',msg.text)
if Replay and redis:get(boss.."lock_rdodSource"..msg.chat_id_) then 
Caption = redis:hget(boss..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendAnimation(msg.chat_id_,msg.id_,Replay,Caption)  
return false
end

Replay = redis:hget(boss..'replay_audio:group:',msg.text)
if Replay and redis:get(boss.."lock_rdodSource"..msg.chat_id_) then 
Caption = redis:hget(boss..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendAudio(msg.chat_id_,msg.id_,Replay,"",Caption)  
return false
end

Replay = redis:hget(boss..'replay_sticker:group:',msg.text)
if Replay and redis:get(boss.."lock_rdodSource"..msg.chat_id_) then 
sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(boss..'replay_video:group:',msg.text)
if Replay and redis:get(boss.."lock_rdodSource"..msg.chat_id_) then 
Caption = redis:hget(boss..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendVideo(msg.chat_id_,msg.id_,Replay,Caption)
return false
end

Replay = redis:hget(boss..'replay_photo:group:'..msg.chat_id_,msg.text)
if Replay and redis:get(boss..'replay'..msg.chat_id_) then 
Caption = redis:hget(boss..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendPhoto(msg.chat_id_,msg.id_,Replay,Caption)  
return false
end

Replay = redis:hget(boss..'replay_voice:group:'..msg.chat_id_,msg.text)
if Replay and redis:get(boss..'replay'..msg.chat_id_) then 
Caption = redis:hget(boss..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendVoice(msg.chat_id_,msg.id_,Replay,Caption)
return false
end

Replay = redis:hget(boss..'replay_animation:group:'..msg.chat_id_,msg.text)
if Replay and redis:get(boss..'replay'..msg.chat_id_) then 
Caption = redis:hget(boss..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendAnimation(msg.chat_id_,msg.id_,Replay,Caption)  
return false
end

Replay = redis:hget(boss..'replay_audio:group:'..msg.chat_id_,msg.text)
if Replay and redis:get(boss..'replay'..msg.chat_id_) then 
Caption = redis:hget(boss..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendAudio(msg.chat_id_,msg.id_,Replay,"",Caption)  
return false
end

Replay = redis:hget(boss..'replay_sticker:group:'..msg.chat_id_,msg.text)
if Replay and redis:get(boss..'replay'..msg.chat_id_) then 
sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(boss..'replay_video:group:'..msg.chat_id_,msg.text)
if Replay and redis:get(boss..'replay'..msg.chat_id_) then 
Caption = redis:hget(boss..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendVideo(msg.chat_id_,msg.id_,Replay,Caption)
return false
end

end,{msg=msg})
end
--=============================================================================================================================
if msg.SudoUser and msg.text and redis:get(boss..'addrdRandom1Public:'..msg.chat_id_..msg.sender_user_id_) then 
if not redis:get(boss..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
if utf8.len(msg.text) > 25 then return sendMsg(msg.chat_id_,msg.id_,"• معليش مو مسموح تضيف اكثر من 25 حرف كلمة رد \n ") end
redis:setex(boss..'addrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_,1400,true) 
redis:setex(boss..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_,1400,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"• حلو , الحين ارسل جواب الرد المتعدد العام \n• ([ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]) \n• مع العلم يمديك تضيف 10 ردود متعدده بس  \n  ")
end
end



if  msg.SudoUser and msg.text and redis:get(boss..':DelrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_) then
redis:del(boss..':DelrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_)
local DelRd = redis:del(boss..':ReplayRandom:'..msg.text) 
if DelRd == 0 then 
return sendMsg(msg.chat_id_,msg.id_,'*•* هذا الرد مو مضاف في قائمة الردود المتعدده ')
end
redis:del(boss..':caption_replay:Random:'..msg.text) 
redis:srem(boss..':KlmatRRandom:',msg.text) 
return sendMsg(msg.chat_id_,msg.id_,'*•* ابشر حذفت الرد \n')
end
--=============================================================================================================================
if msg.text and redis:get(boss.."lock_rdodSource"..msg.chat_id_) then

--================================{{  Reply Bot  }} ===================================

local su = {
"قلبه",
"يابعد عيون ["..Bot_Name.."] ",
"روحي"}
local ss97 = {
"عيونه","هلا",
"نعم","امرني ياعيوني","لبيه","قول شعندك",
"رنق رنق قول ياخي","سم","امرني",
"هلا والله","ها يعمري",
"نييم","روحه","هاه",
"زفت",
"الله ياخذ ["..Bot_Name.."] ","لبيه","ها ","الله يرزقك حياة غير ["..Bot_Name.."] ",
"تواصل مع مدير اعمالي","سم لبيه امر",
"عيوني","؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟",
}
local bs = {
"",
"",
"",
"",
}
local ns = {
"هلا فيك",
"هايات",
"هلا قلبي️",
"منور",
"اهلين",
}
local sh = {
"هلا بتاج راسي",
"هلا بتاج راسي",
}
local lovm = {
"يلبيييه",
"اكثر",
"يعمري",
"اعشقك",
"احلى من يحبني",
"يحظي والله",
"اكثر اكثر اكثرر",
"يروحي",
"اموت فيك",
}
local mm = {
"ابركها من ساعة","احبك","اكثر","ترا ازعجتنا","انقلع","طيب",
}
local m12 = {
"مالك دخل","تمام","بخير","تمام انت كيفك","بخير دامك بخير",
}
local gg = {
"مره","هات لنا سالفة","رح دورلك حياة","مررررررررررره","اونسك يعمري","اونسك يروحي",
}

local zg = {
"عييييييييب","عيب","زق بوجهك","يا قليل التربيه","يا قليل الادب","؟؟؟؟؟؟","ياليت تتأدب","بقص لسانك","حاضر","ياخي عيب","؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟",
}

local tbn = {
"عييييييييب","عيب","تبن بوجهك","يا قليل التربيه","يا قليل الادب","؟؟؟؟؟؟","ياليت تتأدب","بقص لسانك","حاضر","ياخي عيب","؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟",
}

local ra = {
"عييييييييب","عيب","خرا بوجهك","يا قليل التربيه","يا قليل الادب","؟؟؟؟؟؟","ياليت تتأدب","بقص لسانك","حاضر","ياخي عيب","؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟",
}

local sb = {
"عييييييييب","عيب","ياكلب عيب","يا قليل التربيه","يا قليل الادب","؟؟؟؟؟؟","ياليت تتأدب","بقص لسانك","حاضر","ياخي عيب","؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟","استغفر الله",
}

local bb = {
"اسمي تيد","انطم","مو بوت!","اذلف","تراها زاقه","الله يعين","اسممممممممممييي تتتتتتتييييييددددد","ياصبر الارض","هاه","ت ي د","؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟؟","تراك ازعجتنا","الله يصبرني",
}


local Text = msg.text
local Text2 = Text:match("^"..Bot_Name.." (%d+)$")

if msg.SudoUser and Text == Bot_Name and not Text2 then
return sendMsg(msg.chat_id_,msg.id_,su[math.random(#su)])
elseif not msg.SudoUser and Text== Bot_Name and not Text2 then  
return sendMsg(msg.chat_id_,msg.id_,ss97[math.random(#ss97)])
elseif Text:match("^قول (.*)$") then
if utf8.len(Text:match("^قول (.*)$")) > 500 then 
return sendMsg(msg.chat_id_,msg.id_,"• ما اقدر اقول اكثر من 500 حرف ")
end
local callback_Text = FlterName(Text:match("^قول (.*)$"),500)
if callback_Text and callback_Text == 'الاسم سبام ' then
return sendMsg(msg.chat_id_,msg.id_,"• للاسف النص هذا مخالف ")
else
return sendMsg(msg.chat_id_,0,callback_Text) 
end

elseif Text:match("^قولي (.*)$") then
if utf8.len(Text:match("^قولي (.*)$")) > 500 then 
return sendMsg(msg.chat_id_,msg.id_,"• ما اقدر اقول اكثر من 500 حرف ")
end
local callback_Text = FlterName(Text:match("^قولي (.*)$"),500)
if callback_Text and callback_Text == 'الاسم سبام ' then
return sendMsg(msg.chat_id_,msg.id_,"• للاسف النص هذا مخالف ")
else
return sendMsg(msg.chat_id_,0,callback_Text) 
end

elseif Text:match("^"..Bot_Name.." اتفل (.*)$") then
if msg.reply_id then
sendMsg(msg.chat_id_,msg.id_,'')
sendMsg(msg.chat_id_,msg.reply_id,'')
else 
return sendMsg(msg.chat_id_,msg.id_,"  ")
end
elseif Text:match("^"..Bot_Name.." (.*)$") and msg.SudoUser then
if msg.reply_id then
sendMsg(msg.chat_id_,msg.id_,'')
return sendMsg(msg.chat_id_,msg.reply_id,'') 
end
elseif Text:match("^ (.*)$") then 
if msg.reply_id then 
return sendMsg(msg.chat_id_,msg.reply_id,bs[math.random(#bs)])
else
return sendMsg(msg.chat_id_,msg.id_,"")
end 
elseif msg.SudoUser and Text=="هلو" then 
return sendMsg(msg.chat_id_,msg.id_,sh[math.random(#sh)])
elseif not msg.SudoUser and Text=="هلو" then 
return sendMsg(msg.chat_id_,msg.id_,ns[math.random(#ns)])
elseif msg.SudoUser and Text== "احبك" then 
return sendMsg(msg.chat_id_,msg.id_,"اكثر")
elseif msg.SudoUser and Text== "تحبني" or Text=="" then 
return sendMsg(msg.chat_id_,msg.id_,"اكيد")
elseif not msg.SudoUser and Text== "احبك" or Text=="" then 
return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
elseif not msg.SudoUser and Text== "احبك" then
return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
elseif Text== "غني" or Text=="غنيلي" then 
return sendMsg(msg.chat_id_,msg.id_,song[math.random(#song)])
elseif Text== "كريهه" or Text=="اكرهك" then 
return sendMsg(msg.chat_id_,msg.id_,mm[math.random(#mm)])
elseif Text=="شمسوي" or Text== "اخبارك" or Text=="شلونك" then 
return sendMsg(msg.chat_id_,msg.id_,m12[math.random(#m12)])
elseif Text== "طفش" or Text== "طفشان" or Text=="طفشانه" or Text== "ملل" then
return sendMsg(msg.chat_id_,msg.id_,gg[math.random(#gg)])
elseif Text== "كل زق" or Text== "كلزق" or Text=="علزق" or Text== "زق" or Text== "كلزقك" or Text== "كليزق" or Text== "كلي زق" or Text== "كولي زق" then
return sendMsg(msg.chat_id_,msg.id_,zg[math.random(#zg)])
elseif Text== "كل تبن" or Text== "كلتبن" or Text=="على تبن" or Text== "تبن" or Text== "كلي تبن" or Text== "كولي تبن" then
return sendMsg(msg.chat_id_,msg.id_,tbn[math.random(#tbn)])
elseif Text== "كل خرا" or Text== "كلخرا" or Text=="على خرا" or Text== "خرا" or Text== "كلي خرا" or Text== "كولي خرا" then
return sendMsg(msg.chat_id_,msg.id_,ra[math.random(#ra)])
elseif Text== "كسمك" or Text== "كس امك" or Text=="قحبه" or Text== "ياقحبه" or Text== "ياخنيث" or Text== "خنيث" or Text== "انيكك" or Text== "اركب عليه" then
return sendMsg(msg.chat_id_,msg.id_,sb[math.random(#sb)])
elseif Text== "بوت" or Text== "ولد انس"  then
return sendMsg(msg.chat_id_,msg.id_,bb[math.random(#bb)])
elseif Text=="" or Text=="" then
if msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,'')
else 
return sendMsg(msg.chat_id_,msg.id_,"") 
end


elseif Text== "ايديي" or Text=="ايدي" then 
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
USERNAME = USERNAME:gsub([[\_]],"_")
USERCAR = utf8.len(USERNAME) 
SendMention(msg.chat_id_,data.id_,msg.id_," "..data.id_.." ",37,USERCAR)  
return false
end)
elseif Text=="ابي رابط الحذف" or Text=="رابط حذف" or Text=="رابط الحذف" or Text=="الحذف" then
return sendMsg(msg.chat_id_,msg.id_,[[
** رابط حذف حـساب التليجرام ↯
 فكر لاتستعجل  
 بالتوفيق ..
  https://telegram.org/deactivate
]] )
--=====================================
elseif Text== "" or Text== "" or Text=="" then
if msg.SudoUser then  
return sendMsg(msg.chat_id_,msg.id_,"")
elseif msg.Creator then 
return sendMsg(msg.chat_id_,msg.id_,"")
elseif msg.Director then 
return sendMsg(msg.chat_id_,msg.id_,"")
elseif msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,"")
else 
return sendMsg(msg.chat_id_,msg.id_,"")
end 
end 


end


------------------------------{ End Replay Send }------------------------

------------------------------{ Start Checking CheckExpire }------------------------

if redis:get(boss..'CheckExpire::'..msg.chat_id_) then
local ExpireDate = redis:ttl(boss..'ExpireDate:'..msg.chat_id_)
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
if SUDO_USER:match('@[%a%d_]+') then 
SUDO_USERR = "\n👨🏾‍🔧¦ راسل المطور للتجديد ["..SUDO_USER.."]"
else
SUDO_USERR = ""
end
if not ExpireDate and not msg.SudoUser then
rem_data_group(msg.chat_id_)
sendMsg(SUDO_ID,0,'🕵🏼️‍♀️¦ انتهى الاشتراك في احد المجموعات ✋🏿\n👨🏾‍🔧¦ المجموعه : '..FlterName(redis:get(boss..'group:name'..msg.chat_id_))..'🍃\n💂🏻‍♀️¦ ايدي : '..msg.chat_id_)
sendMsg(msg.chat_id_,0,'🕵🏼️‍♀️¦ انتهى الاشتراك البوت✋🏿\n💂🏻‍♀️¦ سوف اغادر المجموعه فرصه سعيده 👋🏿'..SUDO_USERR..' 🍃')
return StatusLeft(msg.chat_id_,our_id)
else
local DaysEx = (redis:ttl(boss..'ExpireDate:'..msg.chat_id_) / 86400)
if tonumber(DaysEx) > 0.208 and ExpireDate ~= -1 and msg.Admin then
if tonumber(DaysEx + 1) == 1 and not msg.SudoUser then
sendMsg(msg.chat_id_,'🕵🏼️‍♀️¦ باقي يوم واحد وينتهي الاشتراك ✋🏿\n '..SUDO_USERR..'\n📛')
end 
end 
end
end

------------------------------{ End Checking CheckExpire }------------------------

if msg.text then  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_}, function(arg,data) 
if redis:get(boss.."chencher"..msg.sender_user_id_) then 
if redis:get(boss.."chencher"..msg.sender_user_id_) ~= data.first_name_ then 
tahan = '['..(redis:get(boss.."chencher"..msg.sender_user_id_) or '')..']'
taham = '['..data.first_name_..']'
local taha ={ 
'\n حركات اسم جديد يا '..taham.. ' \n  بس ماش ماعجبني اسمك الاول احسن '..tahan..'',
'\n مو كان اسمك '..tahan..' ليه غيرته ؟',
}
sendMsg(msg.chat_id_,msg.id_,taha[math.random(#taha)])
end  
end
redis:set(boss.."chencher"..msg.sender_user_id_, data.first_name_) 
end,nil) 
end


end 

return {
Boss = {
"^(مسح قائمه الرتب)$",
"^(مسح الرتب)$",
"^(مسح قائمة الرتب)$",
"^(مسح الرتبه)$",
"^(مسح رتبه)$",
"^(تغير الرتبه)$",
"^(تغيير الرتبه)$",
"^(تغيير رتبه)$",
"^(تغير رتبه)$",
"^(قائمه الرتب)$",
"^(قائمة الرتب)$",
"^(المالك)$",
"^(مالك)$",
"^(المنشئ)$",
"^(المنشى)$",
"^(رفع القيود)$",
"^(رفع القيود) (%d+)$",
"^(رفع القيود) (@[%a%d_]+)$",
"^(تقييد) (%d+)$",
"^(تقييد) (@[%a%d_]+)$",
"^(الغاء التقييد) (%d+)$",
"^(الغاء التقييد) (@[%a%d_]+)$",
"^(الغاء تقييد) (%d+)$",
"^(الغاء تقييد) (@[%a%d_]+)$",
"^(فك التقييد) (%d+)$",
"^(فك التقييد) (@[%a%d_]+)$",
"^(فك تقييد) (%d+)$",
"^(فك تقييد) (@[%a%d_]+)$",
"^(وضع شرط التفعيل) (%d+)$",
"^(التفاعل) (@[%a%d_]+)$",
"^(التفاعل) (%d+)$",
"^(ايدي) (@[%a%d_]+)$",
"^(كشف) (%d+)$",
"^(كشف) (@[%a%d_]+)$",
'^(رفع مميز) (@[%a%d_]+)$',
'^(رفع مميز) (%d+)$',
'^(تنزيل الكل) (@[%a%d_]+)$',
'^(تنزيل الكل) (%d+)$',
'^(تنزيل مميز) (@[%a%d_]+)$',
'^(تنزيل مميز) (%d+)$',
'^(رفع ادمن) (@[%a%d_]+)$',
'^(رفع ادمن) (%d+)$',
'^(تنزيل ادمن) (@[%a%d_]+)$',
'^(تنزيل ادمن) (%d+)$', 
'^(رفع مدير) (@[%a%d_]+)$',
'^(رفع المدير) (@[%a%d_]+)$',
'^(رفع المدير) (%d+)$',
'^(رفع مدير) (%d+)$',
'^(رفع منشئ) (@[%a%d_]+)$',
'^(رفع مالك) (%d+)$',
'^(رفع منشئ) (%d+)$',
'^(رفع مالك) (@[%a%d_]+)$',
'^(رفع مشرف) (@[%a%d_]+)$',
'^(تنزيل مشرف)$',
'^(تنزيل مشرف) (%d+)$',
'^(رفع مشرف)$',
'^(رفع مشرف) (%d+)$',
'^(تنزيل منشئ) (%d+)$',
'^(تنزيل مالك) (%d+)$',
'^(تنزيل مشرف) (@[%a%d_]+)$',
'^(تنزيل مالك) (@[%a%d_]+)$',
'^(تنزيل منشئ) (@[%a%d_]+)$',
'^(تنزيل مدير) (@[%a%d_]+)$',
'^(تنزيل المدير) (@[%a%d_]+)$',
'^(تنزيل المدير) (%d+)$',
'^(تنزيل مدير) (%d+)$',
'^(وضع تكرار) (%d+)$',
'^(وضع وقت التنظيف) (%d+)$',
"^(مسح)$",
"^(مسح) (.+)$",
'^(منع) (.+)$',
'^(الغاء منع) (.+)$',
"^(حظر عام) (@[%a%d_]+)$",
"^(حظر عام) (%d+)$",
"^(الغاء العام) (@[%a%d_]+)$",
"^(الغاء العام) (%d+)$",
"^(الغاء عام) (@[%a%d_]+)$",
"^(الغاء عام) (%d+)$",
"^(حظر) (@[%a%d_]+)$",
"^(حظر) (%d+)$",
"^(الغاء الحظر) (@[%a%d_]+)$",
"^(الغاء الحظر) (%d+)$",
"^(الغاء حظر) (@[%a%d_]+)$",
"^(الغاء حظر) (%d+)$",
"^(طرد) (@[%a%d_]+)$",
"^(طرد) (%d+)$",
"^(كتم) (@[%a%d_]+)$",
"^(كتم) (%d+)$",
"^(الغاء الكتم) (@[%a%d_]+)$",
"^(الغاء الكتم) (%d+)$",
"^(الغاء كتم) (@[%a%d_]+)$",
"^(الغاء كتم) (%d+)$",
"^(رفع مطور) (@[%a%d_]+)$",
"^(رفع مطور) (%d+)$",
"^(تنزيل مطور) (%d+)$",
"^(تنزيل مطور) (@[%a%d_]+)$",
"^(رفع منشئ اساسي) (@[%a%d_]+)$",
"^(رفع منشئ اساسي) (%d+)$",
"^(تنزيل منشئ اساسي) (@[%a%d_]+)$",
"^(تنزيل منشئ اساسي) (%d+)$",

"^(رفع مالك اساسي) (@[%a%d_]+)$",
"^(رفع مالك اساسي) (%d+)$",
"^(تنزيل مالك اساسي) (@[%a%d_]+)$",
"^(تنزيل مالك اساسي) (%d+)$",


"^(الاشتراك) ([123])$",
"^(شحن) (%d+)$",
"^(تغيير امر) (.*)$",
"^(تغير امر) (.*)$",
"^(اضف امر) (.*)$",
"^(اضف امر)$",
"^(مسح امر) (.*)$",
"^(مسح امر)$",

"^([Ss][pP]) ([%a%d_]+.lua)$", 
"^([dD][pP]) ([%a%d_]+.lua)$", 


"^(منشن)$",
"^(منشن للكل)$",
"^(تاق)$",
"^(تاق للكل)$",
"^(تنزيل الكل)$",
"^(تقييد)$",
"^(الغاء التقييد)$",
"^(الغاء تقييد)$",
"^(فك التقييد)$",
"^(فك تقييد)$",
"^(التفاعل)$",
"^([iI][dD])$",
"^(ايدي)$",
"^(كشف)$",
'^(رفع مميز)$',
'^(تنزيل مميز)$',
'^(رفع ادمن)$',
'^(تنزيل ادمن)$', 
'^(رفع المدير)$',
'^(رفع مدير)$',
'^(رفع مالك)$',
'^(رفع منشئ)$',
'^(تنزيل منشئ)$',
'^(تنزيل مالك)$',
'^(تنزيل المدير)$',
'^(تنزيل مدير)$',
'^(تفعيل)$',
'^(تعطيل)$',
'^(تعطيل) [-]100(%d+)$',

"^(مسح كلايش التعليمات)$",



"^(تعديلاتي)$",
"^(تكليجاتي)$",
"^(تعين الايدي)$",
"^(تعيين ايدي)$",
"^(تعيين كليشه الستارت)$",
"^(تعيين كليشه الستارت)$",
"^(مسح كليشة الستارت)$",
"^(مسح كليشه الستارت)$",
"^(مسح كليشه الستارت)$",
"^(تعيين كليشه الايدي عام)$",
"^(تعيين كليشه الايدي عام)$",
"^(تعيين الايدي عام)$",
"^(تعين الايدي عام)$",
"^(تعيين ايدي عام)$",

"^(تعيين كليشه الايدي)$",
"^(تعيين كليشة الايدي)$",
"^(تعيين الايدي)$",
"^(حظر عام)$",
"^(الغاء العام)$",
"^(الغاء عام)$",
"^(حظر)$",
"^(الغاء الحظر)$",
"^(الغاء حظر)$",
"^(طرد)$",
"^(كتم)$",
"^(الغاء الكتم)$",
"^(الغاء كتم)$",
"^(رفع مطور)$",
"^(تنزيل مطور)$",
"^(رفع منشئ اساسي)$",
"^(تنزيل منشئ اساسي)$",
"^(رفع مالك اساسي)$",
"^(تنزيل مالك اساسي)$",
"^(تعيين قائمه الاوامر)$",
"^(الاشتراك)$",
"^(المجموعه)$",
"^(كشف البوت)$",
"^(انشاء رابط)$",
"^(وضع الرابط)$",
"^(تثبيت)$",
"^(الغاء التثبيت)$",
"^(الغاء تثبيت)$",
"^(رابط)$",
"^(الرابط)$",
"^(القوانين)$",
"^(وضع القوانين)$",
"^(وضع قوانين)$",
"^(وضع تكرار)$",
"^(وضع التكرار)$",
"^(المالكين)$",
"^(المالكيين)$",
"^(المالكين الاساسين)$",
"^(المالكيين الاساسيين)$",
"^(الادمنيه)$",
"^(الادمن)$",
"^(قائمه المنع)$",
"^(المدراء)$",
"^(المميزين)$",
"^(المكتومين)$",
"^(وضع ترحيب)$",
"^(وضع الترحيب)$",
"^(الترحيب)$",
"^(المحظورين)$",
"^(وضع اسم)$",
"^(وضع صوره)$",
"^(وضع وصف)$",
"^(طرد البوتات)$",
"^(كشف البوتات)$",
"^(طرد المحذوفين)$",
"^(رسائلي)$",
"^(رسايلي)$",
"^(احصائياتي)$",
"^(معلوماتي)$",
"^(موقعي)$",
"^(رفع الادمنيه)$",
"^(رفع الادمن)$",
"^(صوره الترحيب)$",
"^(ضع كليشه المطور)$",
"^(المطور)$",
"^(شرط التفعيل)$",
"^(قائمه المجموعات)$",
"^(المجموعات)$",
"^(اذاعه)$",
"^(اذاعه عام)$",
"^(اذاعه خاص)$",
"^(اذاعه عام بالتوجيه)$",
"^(اذاعه عام بالتوجيه)$", 
"^(اذاعه خاص)$", 
"^(اذاعه عام)$", 
"^(اذاعه)$", 
"^(قائمه العام)$",
"^(قائمه العام)$",
"^(المطورين)$",
"^(المطورين)$",
"^(تيست)$",
"^(test)$",
"^(ايدي)$",
"^(قناة السورس)$",
"^(الاحصائيات)$",
"^(الاحصائيات)$",
"^(اضف رد عام)$",
"^(اضف رد عام)$",
"^(مسح الردود)$",
"^(مسح الردود العامه)$",
"^(ضع اسم للبوت)$",
"^(حذف صوره)$",
"^(مسح رد)$",
"^(الردود)$",
"^(الردود العامه)$",
"^(الردود العامه)$",
"^(اضف رد)$",
"^(/UpdateSource)$",
"^(تحديث السورس ™)$",
"^(تحديث السورس)$",
"^(تنظيف المجموعات)$",
"^(تنظيف المشتركين)$",
"^(رتبتي)$",
"^(ضع اسم للبوت)$",
"^(ضع صوره للترحيب)$",
"^(وضع صوره للترحيب)$",
"^(الحمايه)$",
"^(الاعدادات)$",
"^(الوسائط)$",
"^(الغاء الامر)$",
"^(الرتبه)$",
"^(الغاء)$",
"^(الساعه)$",
"^(التاريخ)$",
"^(متجر الملفات)$",
"^(الملفات)$",
"^(الملفات)$",
"^(اصدار السورس)$",
"^(الاصدار)$",
"^(server)$",
"^(تغيير امر)$",
"^(تغير امر)$",
"^(السيرفر)$",
"^(اذاعه بالتثبيت)$",
"^(اذاعه بالتثبيت)$",
"^(نسخه احتياطيه للمجموعات)$",
"^(رفع نسخه الاحتياطيه)$", 

"^(تفعيل ردود المطور)$", 
"^(تعطيل ردود المطور)$", 
"^(تفعيل التنظيف التلقائي)$", 
"^(تعطيل التنظيف التلقائي)$", 

"^(تفعيل الاشتراك الاجباري)$", 
"^(تعطيل الاشتراك الاجباري)$", 
"^(تغيير الاشتراك الاجباري)$", 
"^(الاشتراك الاجباري)$", 
"^(ادفرني)$", 
"^(مغادره)$", 
"^(قائمه الاوامر)$", 
"^(قائمة الاوامر)$", 
"^(مسح الاوامر)$", 
"^(مسح قائمة الاوامر)$", 
"^(احظرني)$", 
"^(اطردني)$", 
"^(جهاتي)$", 
"^(وضع رابط)$", 
"^(نقل ملكيه البوت)$", 
"^(نقل ملكيه البوت)$", 
"^(مسح كليشه الايدي)$", 
"^(مسح الايدي)$", 
"^(مسح ايدي)$", 
"^(مسح كليشة الايدي)$", 
"^(مسح كليشه الايدي عام)$", 
"^(مسح كليشه الايدي عام)$", 
"^(مسح الايدي عام)$", 
"^(مسح ايدي عام)$", 
"^(مسح كليشة الايدي عام)$", 
"^(السورس)$",
"^(سورس)$",
"^(م المطور)$", 
"^(اوامر الرد)$",
"^(اوامر الملفات)$",
"^(الاوامر)$",
"^(م1)$",
"^(م2)$",
"^(م3)$",
"^(الاغاني)$",
"^(التسليه)$",
"^(التسلية)$",
"^(اوامر التسليه)$",
"^(اوامر التسلية)$",
"^(الساوند)$",
"^(ساوند كلاود)$",
"^(الساوند كلاود)$",
"^(اليوتيوب)$", 
"^(/store)$", 
"^(/files)$", 
"^(قفل الصور بالتقييد)$",
"^(قفل الفيديو بالتقييد)$",
"^(قفل المتحركه بالتقييد)$",
"^(قفل التوجيه بالتقييد)$",
"^(قفل الروابط بالتقييد)$",
"^(قفل الدردشه)$",
"^(قفل المتحركه)$",
"^(قفل الصور)$",
"^(قفل الفيديو)$",
"^(قفل البصمات)$",
"^(قفل الصوت)$",
"^(قفل الملصقات)$",
"^(قفل الجهات)$",
"^(قفل التوجيه)$",
"^(قفل الموقع)$",
"^(قفل الملفات)$",
"^(قفل الاشعارات)$",
"^(قفل الانلاين)$",
"^(قفل الالعاب)$",
"^(قفل الكيبورد)$",
"^(قفل الروابط)$",
"^(قفل الهاشتاق)$",
"^(قفل المعرفات)$",
"^(قفل التعديل)$",
"^(قفل الكلايش)$",
"^(قفل التكرار)$",
"^(قفل البوتات)$",
"^(قفل البوتات بالطرد)$",
"^(قفل الماركدوان)$",
"^(قفل الويب)$",
"^(قفل التثبيت)$",
"^(قفل الاضافه)$",
"^(قفل الانجليزيه)$",
"^(قفل الانجليزية)$",
"^(قفل الفارسيه)$",
"^(قفل الفشار)$",
"^(قفل السب)$",
"^(فتح الصور بالتقييد)$",
"^(فتح الفيديو بالتقييد)$",
"^(فتح المتحركه بالتقييد)$",
"^(فتح التوجيه بالتقييد)$",
"^(فتح الروابط بالتقييد)$",
"^(فتح الدردشه)$",
"^(فتح المتحركه)$",
"^(فتح الصور)$",
"^(فتح الفيديو)$",
"^(فتح البصمات)$",
"^(فتح الصوت)$",
"^(فتح الملصقات)$",
"^(فتح الجهات)$",
"^(فتح التوجيه)$",
"^(فتح الموقع)$",
"^(فتح الملفات)$",
"^(فتح الاشعارات)$",
"^(فتح الانلاين)$",
"^(فتح الالعاب)$",
"^(فتح الكيبورد)$",
"^(فتح الروابط)$",
"^(فتح الهاشتاق)$",
"^(فتح المعرفات)$",
"^(فتح التعديل)$",
"^(فتح الكلايش)$",
"^(فتح التكرار)$",
"^(فتح البوتات)$",
"^(فتح البوتات بالطرد)$",
"^(فتح الماركدوان)$",
"^(فتح الويب)$",
"^(فتح التثبيت)$",
"^(فتح الاضافه)$",
"^(فتح الانجليزيه)$",
"^(فتح الانجليزية)$",
"^(فتح الفارسيه)$",
"^(فتح الفشار)$",
"^(فتح السب)$",
"^(تعطيل الردود)$",
"^(تعطيل الاذاعه)$",
"^(تعطيل الاذاعه)$",
"^(تعطيل الايدي)$",
"^(تعطيل الترحيب)$",
"^(تعطيل التحذير)$",
"^(تعطيل الايدي بالصوره)$",
"^(تعطيل الحمايه)$",
"^(تعطيل الحماية)$",
"^(تعطيل المغادره)$",
"^(تعطيل اطردني)$",
"^(تعطيل تعيين الايدي)$",
"^(تعطيل تعيين الايدي)$",
"^(تعطيل الحظر)$",
"^(تعطيل الرابط)$",
"^(تعطيل المنشن)$",
"^(تعطيل التاق)$",
"^(تعطيل التاق للكل)$",
"^(تعطيل المنشن للكل)$",
"^(تعطيل منشن)$",
"^(تعطيل التحقق)$",
"^(تفعيل الردود)$",
"^(تفعيل الاذاعه)$",
"^(تفعيل الاذاعه)$",
"^(تفعيل الايدي)$",
"^(تفعيل الترحيب)$",
"^(تفعيل التحذير)$",
"^(تفعيل الايدي بالصوره)$",
"^(تفعيل الحمايه)$",
"^(تفعيل الحماية)$",
"^(تفعيل المغادره)$",
"^(تفعيل اطردني)$",
"^(تفعيل تعيين الايدي)$",
"^(تفعيل تعيين الايدي)$",
"^(تفعيل الحظر)$",
"^(تفعيل الرابط)$",
"^(تفعيل المنشن)$",
"^(تفعيل التاق)$",
"^(تفعيل التاق للكل)$",
"^(تفعيل المنشن للكل)$",
"^(تفعيل منشن)$",
"^(تفعيل التحقق)$",
"^(تفعيل البوت خدمي)$",
"^(تفعيل البوت خدمي)$",
"^(تعطيل البوت خدمي)$",
"^(تعطيل البوت خدمي)$",
"^(تفعيل التواصل)$",
"^(تفعيل التواصل)$",
"^(تفعيل الاشتراك الاجباري)$",
"^(تعطيل الاشتراك الاجباري)$",
"^(تغيير الاشتراك الاجباري)$",
"^(الاشتراك الاجباري)$",
"^(تعطيل التواصل)$",
"^(قفل الكل)$",
"^(فتح الكل)$",
"^(قفل الوسائط)$",
"^(فتح الوسائط)$",
"^(منع)$",
"^(رفع كيك)$",
"^(تنزيل كيك)$",
"^(مسح المالكيين الاساسيين)$",
"^(مسح المالكين الاساسيين)$",
"^(مسح المالكيين الاساسين)$",
"^(مسح المالكين الاساسين)$",
"^(مسح الرسائل المجدوله)$",
"^(مسح الميديا)$",
"^(مسح الوسائط)$",
"^(مسح التعديلات)$",
"^(مسح تكليجاتي)$",
"^(مسح تعديلاتي)$",
"^(مسح الادمنيه)$",
"^(مسح الادمن)$",
"^(مسح قائمه المنع)$",
"^(مسح قائمة المنع)$",
"^(مسح القوانين)$",
"^(مسح الترحيب)$",
"^(مسح المالكيين)$",
"^(مسح المالكين)$",
"^(مسح المدراء)$",
"^(مسح المحظورين)$",
"^(مسح المكتومين)$",
"^(مسح المميزين)$",
"^(مسح الرابط)$",
"^(بايو)$",
"^(تفعيل البايو)$",
"^(تعطيل البايو)$",
"^(تعطيل الردود المتعدده)$",
"^(تعطيل الردود المتعدده)$",
"^(تفعيل الردود المتعدده)$",
"^(تفعيل الردود المتعدده)$",
"^(اضف رد متعدد)$",
"^(مسح رد متعدد)$",
"^(مسح الردود المتعدده)$",
"^(مسح الردود المتعدده)$",
"^(الردود المتعدده)$",
"^(الردود المتعدده)$",
"^(اضف رد متعدد عام)$",
"^(مسح رد متعدد عام)$",
"^(مسح الردود المتعدده العامه)$",
"^(الردود المتعدده العامه)$",
"^(مسح رسايلي)$",
"^(مسح رسائلي)$",
"^(حذف رسائلي)$",
"^(تعطيل التسليه)$",
"^(تفعيل التسليه)$",
"^(رفع زق)$",
"^(تنزيل زق)$",
"^(رفع زق) (@[%a%d_]+)$",
"^(تنزيل زق) (@[%a%d_]+)$",
"^(قائمة الزق)$",
"^(قائمة الزقان)$",
"^(رفع كيكه)$",
"^(تنزيل كيكه)$",
"^(قائمة الكيك)$",
"^(قائمة الكيكات)$",
"^(رفع كيكه) (@[%a%d_]+)$",
"^(تنزيل كيكه) (@[%a%d_]+)$",
"^(رفع حمار)$",
"^(تنزيل حمار)$",
"^(رفع حمار) (@[%a%d_]+)$",
"^(تنزيل حمار) (@[%a%d_]+)$",
"^(قائمة الحمار)$",
"^(قائمة الحمير)$",
"^(رفع عسل)$",
"^(تنزيل عسل)$",
"^(رفع عسل) (@[%a%d_]+)$",
"^(تنزيل عسل) (@[%a%d_]+)$",
"^(قائمة العسل)$",
"^(رفع بقره)$",
"^(تنزيل بقره)$",
"^(رفع بقره) (@[%a%d_]+)$",
"^(تنزيل بقره) (@[%a%d_]+)$",
"^(قائمة البقر)$",
"^(رفع كلب)$",
"^(تنزيل كلب)$",
"^(رفع كلب) (@[%a%d_]+)$",
"^(تنزيل كلب) (@[%a%d_]+)$",
"^(قائمة الكلاب)$",
"^(قائمة الكلب)$",
"^(رفع قرد)$",
"^(تنزيل قرد)$",
"^(رفع قرد) (@[%a%d_]+)$",
"^(تنزيل قرد) (@[%a%d_]+)$",
"^(قائمة القرود)$",
"^(قائمة القرد)$",
"^(رفع تيس)$",
"^(تنزيل تيس)$",
"^(رفع تيس) (@[%a%d_]+)$",
"^(تنزيل تيس) (@[%a%d_]+)$",
"^(قائمة التيس)$",
"^(قائمة التيوس)$",
"^(رفع ثور)$",
"^(تنزيل ثور)$",
"^(رفع ثور) (@[%a%d_]+)$",
"^(تنزيل ثور) (@[%a%d_]+)$",
"^(قائمة الثور)$",
"^(قائمة الثيران)$",
"^(رفع باعوص)$",
"^(تنزيل باعوص)$",
"^(رفع باعوص) (@[%a%d_]+)$",
"^(تنزيل باعوص) (@[%a%d_]+)$",
"^(قائمة البواعيص)$",
"^(قائمة الباعوص)$",
"^(رفع دجاجه)$",
"^(تنزيل دجاجه)$",
"^(رفع دجاجه) (@[%a%d_]+)$",
"^(تنزيل دجاجه) (@[%a%d_]+)$",
"^(قائمة الدجاج)$",
"^(رفع هطف)$",
"^(تنزيل هطف)$",
"^(رفع هطف) (@[%a%d_]+)$",
"^(تنزيل هطف) (@[%a%d_]+)$",
"^(قائمة الهطوف)$",
"^(رفع صياد)$",
"^(رفع صياده)$",
"^(تنزيل صياد)$",
"^(تنزيل صياده)$",
"^(رفع صياد) (@[%a%d_]+)$",
"^(رفع صياده) (@[%a%d_]+)$",
"^(تنزيل صياد) (@[%a%d_]+)$",
"^(تنزيل صياده) (@[%a%d_]+)$",
"^(قائمة الصيادين)$",
"^(رفع خاروف)$",
"^(تنزيل خاروف)$",
"^(رفع خاروف) (@[%a%d_]+)$",
"^(تنزيل خاروف) (@[%a%d_]+)$",
"^(رفع خاروفه)$",
"^(تنزيل خاروفه)$",
"^(رفع خاروفه) (@[%a%d_]+)$",
"^(تنزيل خاروفه) (@[%a%d_]+)$",
"^(قائمة الخرفان)$",
"^(قائمة الخاروف)$",
"^(/Commands)$",
"^(/start commands)$",
"^(/Commands@reecbot)$",

},
iBoss = iBoss,
dBoss = dBoss,
}
