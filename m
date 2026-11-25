Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630217;
	b=JsJJ2sAFBG6zFPUxgwRLSp9HOsM2kt0/LkHn+BoCFRKpZdOV4gth/VI05u3Gg6yG0LJU
	 KHSqDGWvIUdtAHJF4QC0XRefIxWmYyVCOYDz1Zs3Tw7Z/4DC/gPX0MSWIsrGC6u1t6cq6
	 FA32kCJW3oCe+KpizV8D9NSbkEUSMtDl4FSFCG6cvYGhyGwF8GZ9zmM95h/ckDODgzd06
	 ooN7FnJMyej/u35dx/gNq5iS3PKAudIEhg2JLpAjmPiwmNQtvA2w0oSRCCys9DbxthjIx
	 MKv1bGOx6F7jDP11pRMZjTkdulfV8Y1m8e4Q6WMkUauSDTlRkRmqQwB9uvCZzgvJgUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D3ALQHcgOfAhUAKhVbZdjihQ4c8Hm2EiPI8oXAafIGM=;
	b=pMttqeP8JSJSmY/Oh0pzUE7ALlEvrLbl7E6fbn+m+n424hbs3TVlgqU+qhC2Sn+NGP/A
	 n2n/36D4waozV4htaI1psfs9qCFWxbchSt0GMVm0AVODVR+5d9P2BkrgfOBfN6oLyMhhD
	 Tpz2YtuOWLJHDj1E4OLBtjlstcdobM35J8XQwZFNXm9U70EQn7OB6OHbmUTz29oBdaX+k
	 TSdxhGOJgzDqpxpTBaV3wL8rZCduC6img7cKclkKbQuKORuun9UcnOwPecMZvQ8qq+C/+
	 ONVXjdFJJ6GHn/vuWYRfsLa8x4ncB7lCP9XkgnQiqAjwOeU2bFkw0K8LJJGsFpWcFHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b="YdXtTz/v";
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7AB606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F7AB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=YdXtTz/v
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6767d92cde6so6773311d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795630216; x=1796235016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3ALQHcgOfAhUAKhVbZdjihQ4c8Hm2EiPI8oXAafIGM=;
        b=YdXtTz/v6Nm4qzgVyt4tU1Dm9vGEsroperK4W3BGilBnyGrVMOM6MIT5XJD2rcDogB
         AWuqcPc7rOYnD9e+HpsWAPKiW9DYo6OEiOtdmUiLKvIuxOHtWDuJHlD/vCKafPsJxQLC
         BXllwZhuRD1IwujoB6aBtVMXSWBjO++oCGjBlQYfo24feoz8A4QtCZhzrClzWJOySJkX
         +xT/ureqEuqX7lIeo6TLrqv1qZbU8hEhJweFrf0dfdpjPJpNItgT6YU6OW4VThEXW6+m
         cm09thM45wrjt173UXANGAdABSORsn4HM3CBs7dMDTus+al+tGpQ23jXx/OE/f0h4gvn
         cJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630216; x=1796235016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3ALQHcgOfAhUAKhVbZdjihQ4c8Hm2EiPI8oXAafIGM=;
        b=PvvKC/C8WMl8hNeAgm/BR7eUSVrp1Gq57GJn6W/KtGfWky1A/WSlPljbefEoD8b3XP
         Qv3v03rd4UUbOs4QV1Xt6TVYZ7Bg4IT3PaKb3cnvwvyucVWX9CvolcNpxs7wF6sVlyCx
         tjIRCezkVe6DF936HEmsu+/Pj4D2LvlKDJFCNwGkuRpFSUbKTnhxIbmGnV8sR8ufbaLe
         v8ZUSfNL09bvo3LonrJ6kFBCjVBc/YpyHL6ITE9HjAKDs07MN1uVsdLeQc1J/Q5VVf6d
         g3YmVktKvmFiP3HShBQgxqhb1kUToxoxIaiEVuEzS3O/3e23w6MEv8djZZiCsCQm2DJ+
         IkJw==
X-Forwarded-Encrypted: i=1; AL+hErHyQpdqa2aGZ7KSnp+UCjaPKISCgUeHtzw7gp2dAKWKDA4agVilUeNHF/aQcZfBU8C97GavLuLOmJyJTjs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pWZDeTvZBlX//7vJUk8xaTYWGJ7alT7bdE64caMRxgcyhdlXy
	EVKvXU0HeCw03JhAWfre5w+aRmUPJho88BMNjnmbExO7BclyfP0SojAtqmeBgORi/3TJUKG83K0
	ZvXjplWqu
X-Gm-Gg: AZFdTZfa1ZH91J9gY8oaBMmZeTKip5PxrHtdoP3V5j8kQA4MQGTh5lKdzRGIZPnBQFV
	4EVSj/jskYXst7vXhu4+XfSy/COfNOHZe4hIdvw9jftoK7ETc4LRK0Yz2uc4642Og6JNl2L5EAM
	PcAJAgE7ZqyNCxrFZFx6N6IIC4R32QfgtU6VVcQ9dtouAHYRu1h/0qhuM8RjTCxlMNPQU3M1WbC
	Jr9gPcmI2g9ZrHoBWlKPOBJfrrpkjKT/3MMAH8xPTusCWlJc5/furJbzPFtjFpXGOESYGdUsWyd
	ExpPG9AS4m6qPTve5i+bE2XmAMlm7R5kTDEjq5R+LM07exnU1mOSsb4xGKsDj+lbY1EmfZJ73YF
	i+rgWEJRw0c1yFGnwXLExf+LaPZwtXwhhN189HwJK4dBVPTcauDC/lvdSSQovV7lRj5EkTpCrPR
	7ouzymh7aKafE6Ekrnl8zLbb9FApURG8tMvoXKjyTYb7DizTj56pmfAKqdDoNsjBys+Od6cGJ3R
	e7hiqBMdlJKe66nh9cSroThS1DOjI7KM61cZWSE/th+YtEzt4zcMdjTEb+DmcX6HHIp2rD3+Wff
	SZxIt8e/oH5X87bcykSzCfYjZ6bWpw06sNTRG71TDymytR13EmynyA==
X-Received: by 2002:a05:690e:400a:b0:67e:4934:63dd with SMTP id 956f58d0204a3-67e49347cb2mr1238903d50.15.1795630216103;
        Wed, 25 Nov 2026 10:10:16 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df330bfb1sm9206152d50.6.2026.11.25.10.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:10:15 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Pavel Hofman <pavel.hofman@ivitera.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: pcm: oss: Refine slave hw_params after setting format
Date: Wed, 25 Nov 2026 13:10:05 -0500
Message-ID: <20261125181005.3683575-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit 93d7d38fa61d ("ALSA: aloop: add DSD formats") added DSD_U8 to
the formats of snd-aloop. Before that, its narrowest format had 16 bits.

However, snd_pcm_oss_change_params_locked() sets the slave format with
_snd_pcm_hw_param_set(), which does not refine the parameters, while
the access, rate and channels before it are set with refining helpers.
snd_pcm_oss_period_size() then reads a buffer size maximum that is
still computed for the narrowest format, now DSD_U8, so the OSS period
doubles. With the default U8 client format, the doubled period no
longer fits in the format plugin, and snd_pcm_plugin_alloc() returns
-ENOMEM. As of now, an OSS program that asks snd-aloop for 8 channels
at 192 kHz gets ENOMEM from SNDCTL_DSP_SPEED and from every later
ioctl on the same file.

The issue can be reproduced with this program, where card 1 is
snd-aloop:

    #include <fcntl.h>
    #include <stdio.h>
    #include <sys/ioctl.h>
    #include <sys/soundcard.h>

    int main(void)
    {
            int fd = open("/dev/dsp1", O_WRONLY | O_NONBLOCK);
            int ch = 8, rate = 192000, blk = 0;

            ioctl(fd, SNDCTL_DSP_CHANNELS, &ch);
            if (ioctl(fd, SNDCTL_DSP_SPEED, &rate) < 0)
                    perror("SNDCTL_DSP_SPEED");
            if (ioctl(fd, SNDCTL_DSP_GETBLKSIZE, &blk) < 0)
                    perror("SNDCTL_DSP_GETBLKSIZE");
            printf("block size %d\n", blk);
            return 0;
    }

Before that commit, it prints "block size 65536". After that commit,
the result is:

    SNDCTL_DSP_SPEED: Cannot allocate memory
    SNDCTL_DSP_GETBLKSIZE: Cannot allocate memory
    block size 0

This patch will set the format with snd_pcm_hw_param_set(), which
refines the parameters, as is done for the channels just before.

Fixes: 93d7d38fa61d ("ALSA: aloop: add DSD formats")
Cc: <stable@vger.kernel.org>
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
I found this while comparing the behavior of different kernel versions.
I used an LLM to analyze the problem and to draft the patch and this
message, and I analyzed the result myself.

The missing refine is older than that commit, so the patch also halves
the default fragment size on other cards that offer a format narrower
than the one in use. On snd-dummy (U8 and S16_LE) with S16_LE, one
channel at 48 kHz now gets 4096 bytes instead of 8192.

With "ALSA: pcm: oss: Compare max buffer size in bytes" in for-next,
the program above no longer fails, but it prints "block size 131072"
until this patch is applied.

Tested on for-linus (5a6fcabe156e) and for-next (486060b97284) with
KASAN and lockdep. On snd-aloop, a grid of 1 to 128 channels at 8 to
192 kHz gives the same results as before that commit, and SETFRAGMENT,
mmap and a playback and capture pair work as before.

 sound/core/oss/pcm_oss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 66162caa45d4..3c2ac8966d5e 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -921,7 +921,8 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 		goto failure;
 	}
  format_found:
-	err = _snd_pcm_hw_param_set(sparams, SNDRV_PCM_HW_PARAM_FORMAT, sformat, 0);
+	err = snd_pcm_hw_param_set(substream, sparams,
+				   SNDRV_PCM_HW_PARAM_FORMAT, sformat, 0);
 	if (err < 0)
 		goto failure;
 

base-commit: 5a6fcabe156e91c6ef2435a74f2d16e6dd39f7c7
-- 
2.53.0

