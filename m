Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689483;
	b=HHO4o8LJWP8cWusKqDrU6dVCxWDotsIq7S4gK75cDOKARBJmjwsciPkNgA3cWTGSRKq5
	 AwpZd2B4mJKiBMMnUSUCGTOSe2Vccpjr9Mnve8i57yeEfm8GVoiq/ld4ZNL+U+r5nSjsP
	 BybzofjQPB+AfnH0hKfnpsmlNvyeHwWE4Q04xgTbZUtO0kJXQDBZnvnSBW9oDX/FE//ef
	 EM74vN8B2iIaonZItcvYnI7vDnMKD2QhzPvMfg2Q937QaZR1YMQS2G4DW9PZQKsb0HfV1
	 w1DS59XQPK0DSSkyuF+mkVYXIFu95xIdWBvbo5QaKqBZmiuosKtfNYT+IHxL5qAnOow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WNHMtOeOE2A38FnJhD72GmJVVL0KvDefcFaN8fCeJcM=;
	b=AuUmDew61Y5SE5rJ1nKoqruvpNquv51zAtQU3XEM34igMpt+uX4YY8+1I4napMZ7qfA2
	 R7EEre263ZU9+ALwyFygIiVgBvYsagl1641knvgVueQ4mOoPX2jzHD239mVamBXkc0EP9
	 f0eWJWR9V7CNv//VKCZGFGirZLMakd7yCBrsQpdHYGNn4yuzHCOLpuZSSVwejSURc+6WW
	 wgrH3rhkMihlf2eE2teFrFLyNTSfZRvivpLt0RtOB1M/M3J4AlOIugooz9MYej+Jqukdz
	 fWeOf5J3uQfDs9qo3Y3T74+0cmjQeTmlOXO7epKqnSJT+UUbpMxVm2F76RM+cbjrt5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uw51CuDv;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E547606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E547606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uw51CuDv
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc751eddf25so4440367a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795689482; x=1796294282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WNHMtOeOE2A38FnJhD72GmJVVL0KvDefcFaN8fCeJcM=;
        b=uw51CuDv8IIVh1o0UAMHIqZ9bdSbg59VfCGMkmhdiSRYFTG2Vv+76CA6LtbSTOeoiU
         x56l6KNkIUrA97M2EysjDqezr6DXn7vsUQYHkrDPC9gJsZgJkJVR0juBLytYQTeOyM6c
         wEFxjHKjbzfKjY5lOiLXKs/tE5HUjri05HD7JhoadzycAZC0TTpho2Rc2VrhIyN0Y4K3
         +8SpwmyUUV8ALNA+rDejT90Zs8OCjkDIwR4gF3/r2NARfl3q4ZGWHPpg1YijXXGLxCjs
         m4lcBId90UkvEgtezG0FXr9+hJ8bhSc0BLjxir9jE8RTcusWKWahw5XpiM9VfbuWRv6K
         8t0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689482; x=1796294282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WNHMtOeOE2A38FnJhD72GmJVVL0KvDefcFaN8fCeJcM=;
        b=xZM5DpZBFeesS7PSVlsTiUqpLfc0eXhRbCrKvYntlYQ3CMN7W+0Q1ipdIedomJoooM
         mD5fyvVuUFoPXArf7v8f2113NzRDkanHwzwVQLbZlFssxVLlIUozvjIi8rAhXE30L9/l
         DBV3U2ifETkgKGeIG6e9MSaZikV9iv9VKzXQ9Ul+p/8o4zpnX0tPaHMZzhltDnRfGzmC
         b8VDNR1JjcBvDBG8NIt7YrtdY+/xoMtJTw7Nw4koavkTI5j9Q/saEHYjuJ7CXwVLZkeC
         +3ggkcRXRjM1aXxtwYAv3H4+VOFQJ1hzh4IKCLA0wsvnFYcsuLJqdZqsxqRoe25yFgpL
         GygA==
X-Forwarded-Encrypted: i=1; AL+hErHBEU5RuL5j0KR0PcWSJ4C4A7Zh6e2AetBKENIkbkl7A2YeuixQ+7/dKq9ZfSBPaVcu/0mcOjms75oJLYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wCk+8wsEL1EC9UA1X2a7y6w6qozC41Fwi1kMPn47JpeoTrj5r
	l8PIYS/sy9V6IQHJnnh4lgaEb3okg9t5t2HRF7AGSwqhQcMe0Fo8u9OT
X-Gm-Gg: AZFdTZetEhHM+esuAw7eoOKHNjXwbZoOPcp1kRRphSi79KkJ0Dw33LkDJwmtAQ8aY8A
	bNfXg3ZF2eSpUK6u84qG2XGlkVqI31fahKld/rD75Nyn0ikcmhkZdQa50o3ytx0F4c6w+DwB1rZ
	7GuVfqBQpjqWNR4XSiWSqCM8DpMtV9dO+jnetLNa1n2NCLvt127PoUw0NZffRfaCnFxUuf1vzY4
	xpZDz1bIerv4qcL6rPpfGNq8pdNmLdvFkLxNKjoqDcFtJzvZfi1vovCuzgWSHd7XwP3VYJW/OpB
	15ATbFPHwtdodn3ELD8bZJ8njkNqAn1JXGcPDfO/7CsvaY0SdK4g6YczW0lmo9GFRoh965OHbsr
	J9c0z2VdCUFZumxA8XDwocWLxZByTv+kNHu9Vf1SvoRtyRzyUa6fEcN8rxQwZes9Ipm2n9JC+o5
	CR9CD45j0I/MQqa07W7wTZGOn3nP/2ykfU+ZWr4IHGS6kDZgArzSiqZMz0Ey1r3vXDnk/QUJA+M
	FgGy2P4nv4pQXF4dcHFZgdz0/qF5Uoo3+XjixgoqdvsjHx87FMpJv1xB2JT6+I7Q0EZy15FcQ2v
	PZ3IMrOrlo13BY6j/khLluupQmCPU7hmxFwHAHXk/GVtnsLE48ixDS64h85h4h8Vm9NOwlgUOwo
	mAzZDykycf9TYeThAmEDbuiGzhzRDI34=
X-Received: by 2002:a17:90b:2f8f:b0:3b3:bd07:665b with SMTP id 98e67ed59e1d1-3b41c9325b1mr19483392a91.40.1795689481744;
        Thu, 26 Nov 2026 02:38:01 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-226-201-204.dynamic-ip.hinet.net. [36.226.201.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm31181694a91.7.2026.11.26.02.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:38:01 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roy <rongh7426@gmail.com>
Subject: [PATCH] ASoC: hdmi-codec: Clear the parsed ELD on unplug
Date: Thu, 26 Nov 2026 18:37:57 +0800
Message-ID: <20261126103757.655758-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
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

When the sink goes away, plugged_cb() clears the raw ELD but leaves
hcp->eld_parsed as it was. The eld#N procfs file prints eld_parsed, so
after an unplug it keeps showing the monitor that was last connected
until something is plugged in again.

On a Raspberry Pi 5 (vc4 HDMI), forcing the connector off through
/sys/class/drm/card1-HDMI-A-1/status leaves /proc/asound/card0/eld#0
at:

  monitor_name		WaveShare
  eld_version		[0x2] CEA-861D or below
  sad_count		1

Clear eld_parsed together with the raw ELD, as hdmi_codec_startup()
already does when it finds an empty ELD. eld_parsed is only used for the
procfs file and the log message in plugged_cb(), so nothing else
changes.

Tested on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39, with this
change applied to its snd-soc-hdmi-codec module), forcing HDMI-A-1 off
and back on twice:
- before: eld#0 still shows WaveShare after each unplug
- after: eld#0 shows an empty ELD (eld_version [0x0], sad_count 0) after
  each unplug and WaveShare again after each replug
- HDMI audio playback still works

This change and its description were written with the help of an AI
coding assistant (Claude); the testing above was done on real hardware.

Fixes: 0ecd24a6d8b2 ("ASoC: hdmi-codec: dump ELD through procfs")
Signed-off-by: Roy <rongh7426@gmail.com>
---
 sound/soc/codecs/hdmi-codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index bc59da2..ff4fa9f 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -973,6 +973,7 @@ static void plugged_cb(struct device *dev, bool plugged)
 	} else {
 		hdmi_codec_jack_report(hcp, 0);
 		memset(hcp->eld, 0, sizeof(hcp->eld));
+		memset(&hcp->eld_parsed, 0, sizeof(hcp->eld_parsed));
 	}
 }
 
-- 
2.51.1.windows.1

