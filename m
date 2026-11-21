Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219787;
	b=V+TklJsQ0XNVikzvKfJ5H3r7uJthmvHhppRxa3yOLHTC3UAyYsxvxHTzDUUDnSOCXmTO
	 4tfHRM13nilpOWMjP5Kv8FubNoHFjnAAIvMaIC1HHxSMNkdyaVv8lnFTCP5kVSOQugGa9
	 VgGUJLSyvdELfJtJKpvtWlbuvRd7KL6XhFlie1kdMXa63XNG3/5LuJ+mAoGviTXoTvA98
	 vZLeOxqwWHGOgFa05KaDEhqqZfgIfBG2yCLjOggx5ErpeGNUoN33uRW53ynpyQnLSPgUw
	 JPsn6vy3uy+0bWJ3Ki9ypwMy+ydHaG12ZPwi1/2Nt4ADod+PSbh7/sEKOIWjqrDjqIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TfQjOJG+q5TH420hZgXUi3pJVIA7KahJ9KaSEEIWQjE=;
	b=ydhPpZ270UTU+PIOdBnlUnkw7UfmgdhwpyhHT9j+WWEqAHS2dsSFZts70CkOWENsMhnS
	 oXkkZMg6mSbN695+RV7Uo1KpNMIjC2QES3rX9RX66U8y+5+Eu8nO0kOZCC1X/s1PHiWo/
	 ndHLc07YeX1WN++pWzeJ0tZWLQF8QKeLtThYqEX1kJihxilC75AgdX/CUcfR5y+1LO6F+
	 WABPIFU4DHdJXkZkK3+cQmudlC+ZogehqSnCqLWndPbSmnopQCjso0/eN/V6WVoht3+HY
	 CqFf+hRYvX7Bv4PZp7rF45JvmFara8y4rHkcM1Y7lWkvgcM1frLcgmKyt4HzoNXo6XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kON81Z98;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938A960A3811
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 938A960A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kON81Z98
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2eff92780daso11229565ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219783; x=1795824583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TfQjOJG+q5TH420hZgXUi3pJVIA7KahJ9KaSEEIWQjE=;
        b=kON81Z98izEq58TMyQcgKe9WUeQP6YbIHJLq+evgtNpTyFOu5oslMTJT4O8OWzMqTH
         TDSmInsdP+oXsLpI0wA+1hP3Ok0NcwplapI+Tl6z1YNqxQFEi7u9XHRjkVDAb74siw6r
         6eW2qWW25iU3hny0h3xgDHnTzs2S7Oc6jRayjdUs5bJd3ILz+YMnrvTZSQJKWVFntCMy
         FW06Zf58rryvzWAoxDR1GysL9UynQQ7sAElzvkSjmzxFZz+WUP4MYxUteA8D1z6w+zmk
         8vXs4bhQTFhOVteitbjt7aLtgl7Lr+QEWPf7Zt1AKZJ0UjTx0nJn7Dqe6O2TnGRi6pLy
         2mUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219783; x=1795824583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TfQjOJG+q5TH420hZgXUi3pJVIA7KahJ9KaSEEIWQjE=;
        b=Y+5sFu2KWrKpOpAPYS7UCX94Cb17pRl2ZCqcidtEk8s9F75I5bqimteZRyAGIcVdDP
         nYNCovnYubUW9Z9Fz8Hi671izUvImOuTEDSqEfrwxUcTPNj6dEVGjmOsQFJ6I89ZTOgG
         fklTENPAad1kghJlud741+S6EksehztScRM0cLOBFM5Lb21oE17YmwEqlpdS9snCAEvc
         OCBuFyOGV/SJ0hUW3TOjGTW64uJONnBY6tZ0imuwvfoKSAfZS0ejq+zfLeDyY/2lxwL4
         sQAmRbSwdB8ACEWEyel3pJ8PtBCEiLC9Hs11zBWi/0X00jtwxmCmnLoBFYjzpLVYxnnu
         +gHQ==
X-Forwarded-Encrypted: i=1; AL+hErHEPFvPMAFVxPp7JSUvb/r4pXFEFBw4yhyBEYN8rPg5Zyxa7VsAf2KHTcUc3E5P0zMDQuE1SOY+i/ReRFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+z+w65Dx8Qao6k2hwb154c/wOHWwz28T2Ea8UwqzSKIMXfOr0k
	eDt5FyY0j20JhjdgN+TALCpA6CBM+ut1haRXE63QcNWdMENp3QLdrkVP
X-Gm-Gg: AZFdTZdi42V4HZ+rSzPQJ/1cJc/xLqL7KKy9C/urQiFHZ7Du7Xnp6KgfROpj/efmIMa
	oDcrnYIkZheM8r/o1cYQiUpph8JgmF3NDiPLk/DOgUSRpWxSGiz5WxFIkDMrtY+Kdsvbv9cvuaI
	GqbjhTdkN04v2UGJD3/58HPkOE7WFNJqdg3H7Qs78/sJRohlhAtjgg+TzZN6Fj4miSxutp0aM8K
	xZ7vVCxvdtZ/e2Y2vKarq8iR58mX1fqiYqZeGbLN9ns1MeeUGDDDKRFERLkwSAOnoBaDsiLZ570
	Fe+FawMuKwhSPTYLoa440um8QxiAYGpUzvv3uQv8B6j77SGIhheaMbHrvcGYo67W3a/FdxzgQA8
	g8CbOU60Dcunqv3FWtsOVGJMWvT29/LtZp+dJPWBeydp7+/OK+LfxkSwvykZX2SFWry3il/EOgD
	xltczuLw7wZ9OVD6MAvW33UQwhYdm85v2QqOZphC75BtqaiKA7ot9ubWKt3CayIOQ4Mj41/WOrf
	s+swXM15M52SeuANK601VkVXotJ7pwPw7XaG/TuTu4qAGwoxJBpXsupubfnXLNiGY4erzTBgnOr
	NiAC1uUnClaheau4PlJnkbnYI8Pa8DQY7qQ77c9DkoH5VCxfuLBovLj5JH/KkJ3QkvoNN7HWF76
	tT17iytTyK+5O6/RhjDqqnAJIEj6/1m8A6IIPBbEMfZ+AItao+u6qO2mUEYd7/EaP6onRui4sBf
	xCAA==
X-Received: by 2002:a17:90b:2f8f:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3b41c98a3f1mr3511276a91.19.1795219782916;
        Fri, 20 Nov 2026 16:09:42 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc613csm1920509a12.5.2026.11.20.16.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:09:42 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	Darren Hart <dvhart@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] platform/x86: dell-laptop: Don't use an unread keyboard state at init
Date: Fri, 20 Nov 2026 16:09:30 -0800
Message-ID: <78b2d044b90dfae5dca66c5eed5cbdfeccc1f4e1.1795219225.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795219225.git.rosenp@gmail.com>
References: <cover.1795219225.git.rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kbd_init_info() ignores the return value of kbd_get_state(). If the
call fails, the uninitialized state on the stack is used to set
kbd_previous_level and kbd_previous_mode_bit, which are later sent to
the BIOS when triggers are enabled or the backlight is turned back on.

kbd_get_info() has already succeeded at that point, so a failure here
may well be transient and is not a reason to give up on the keyboard
backlight. Start from level 0 and the off mode instead: the code below
then picks level 1 and the first supported mode, as it already does
when the backlight is off at boot.

Fixes: 02b2aaaa57ab ("platform: x86: dell-laptop: Add support for keyboard backlight")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v2: fall back to level 0 / off mode instead of returning the error

 drivers/platform/x86/dell/dell-laptop.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index c1a51bf95c25..eca348497ac3 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -1455,7 +1455,7 @@ static inline int kbd_init_info(void)
 	    dell_smbios_find_token(KBD_LED_AC_TOKEN))
 		kbd_timeout_ac_supported = true;
 
-	kbd_get_state(&state);
+	ret = kbd_get_state(&state);
 
 	/* NOTE: timeout value is stored in 6 bits so max value is 63 */
 	if (kbd_info.seconds > 63)
@@ -1472,8 +1472,13 @@ static inline int kbd_init_info(void)
 	 */
 	kbd_info.modes &= ~BIT(KBD_MODE_BIT_ON);
 
-	kbd_previous_level = kbd_get_level(&state);
-	kbd_previous_mode_bit = state.mode_bit;
+	if (ret == 0) {
+		kbd_previous_level = kbd_get_level(&state);
+		kbd_previous_mode_bit = state.mode_bit;
+	} else {
+		kbd_previous_level = 0;
+		kbd_previous_mode_bit = KBD_MODE_BIT_OFF;
+	}
 
 	if (kbd_previous_level == 0 && kbd_get_max_level() != 0)
 		kbd_previous_level = 1;
-- 
2.56.1

