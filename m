Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795474867;
	b=KeG1tdXH0d3rXgO9BmbTaA9v1dvayS7btApy61LzoBQQYvipnn2IbmjCZ1BjdX24LGzL
	 CS2V++nGBpAlq6C2yeoNovUWLGXhu2M66oi7ZHgUsKjcMoR38dRPEzF8sBSmFjP6ZA9pb
	 vqjcal9UfXXjWcOTJ0rET5q+n99cGhwXc0VsP6UTwEtI3d04q3EZgbyOUOnmprnpGHWfR
	 mSmNPo8LDy/HrZSppJ/22Q57ce5wcaMqCB7qnXi1tjk7BH2/un3dr54DnbBi53PSmevBG
	 VoUCm7QQjoDcIsMzFH6ioQWocIcTQTINi1tLdmjG/0xWX7gbiV7etbkwx0nJPKSI/zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Aqohkn9z53SBY8rROqhjekaytCoqauZetpa7fBs5LxI=;
	b=dzu1mBKPCd6S0Rfxw5Lw223gTxQkUrp+sYj1HMxgBuzqXDq4D1OIc+4+Zq7j7tWVS5hz
	 OOuxkRRX+NwOZ/Z+k+fQW5fTKmpzlfJhUbciQYlAX0Gcb21Qf7dADpY3CCnzLIBQJCD/R
	 yEaD81BRdyPSCXs4eeSNTBzfAR7OzVKQHhE99DvfCcprxbLRdLBosVQJK6mEvppF71zJC
	 0ctVVpll0kV1lIUwfctYh3CWlakLjhhcKpSKKFI2C9Xz8MwRl3SDl+eatNCI6LLThPo/y
	 jwchZQXVlgIA96sEvrUBKWjVHRRxJcnuGUW3pIe4N5Uwd+WUNlU3nKllAguf3NXKqlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQfnVn7J;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E084606A322
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E084606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQfnVn7J
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38644aedba1so5878433eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795474866; x=1796079666; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Aqohkn9z53SBY8rROqhjekaytCoqauZetpa7fBs5LxI=;
        b=sQfnVn7JE3591GjQcn8CgenIvgChnWf/Q7F+bGoyzL0ncjbVoQzLnS2v6tXf9eBQzp
         EqdS7phfvIVpWwZ/K3PNphs+sY3bsBXWyHwD8SjQu229DAQ4V1mxGo4+kf/Kih3+dbO2
         RPU63Ynw/46PZJhQsfzGRmIswyGPxz7MRcNiXlwdaViAjMoHsWLPBnEmtnvOkfKggI2J
         7iW2a/i5rigD8R/5GPTBl72X7ln3Qzh/7hR9dm06q/aH3s+F349PkRxSin5zZrEmGPEd
         pvyUo2X/wf8MGbeq5wkUiw8nGHBEgOGetGnnwugrC9EXPX0/wS0Q+fWwl1b4rYjrXoDI
         DNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795474866; x=1796079666;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Aqohkn9z53SBY8rROqhjekaytCoqauZetpa7fBs5LxI=;
        b=sUroiRkmpRvL+carSUrJWbqNYeJRJUWQ9JMN2d7CzidkOUv8w4cr9MMxrUXQdqwGS1
         jVa0DEEYIOEtdGPnkEZDs5SgPwXYCQ8XXw4YDinWX9olEZvDMfEbsjclH6FeCcD98fBp
         DsVaRQsPtJLFRUH/ilrMACukOpn0GEyd5c8vKQ1I5W1YloCGdPm8qEeXKiouAgM65ww1
         Nc+F1ZR3z/mH/xWcJTbcVWxHzAYNLAaCbxnMZLCcN2PwcqoggFp/33Xqilmu/F4IoUrC
         Ij3kbirU/KlH3j3O4HysaLJYSBd43ilb2b6Gs1PfzfAiCUzVRJe4ak1vnKtzM+kg6O49
         fevg==
X-Forwarded-Encrypted: i=1; AL+hErG4ef6uCF6vAyxsTrHmAI/uwq5R614rR0CqltPSCx5VKkCGcnPanuTzcINqhrk2a0OAhZOQtRtWTzeQ0KA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RNtuNcQM3NoC2GSGsKvWgd0dsTny0uOV/C58YpgmsRPZII3Mm
	Tyzdio3YulCNdcXf/BBr9j8vSUqIOjBBL0C5GPYF/T4FLapYvYFEFuVM
X-Gm-Gg: AZFdTZfq+HFv2dDdfvVMrDVQn9oBX26LcCNXs4Yhg9XV1ynMJn4mPnHF/+nGhU6S1TO
	z9MQ89llVgAb+NE9TUsli5TQiuJagZwp8QdD5Ifrkvf1czIE6P30MkUTPo+pWhvcE1bxnJhFg73
	GKStAWLNIiHEW3CfWPYX4nNORWKmDa4WoAWv4GE7pv4h3wnd7XA2tT2afItD/i/7atg2NNV/Kqi
	psAIcun5uLyn7WsDBjqpFbjA6gPeyKQNOticEFExmvgIM7oAv1nR4LC0KV5ikxiEfBOckQBq8Do
	laBgOCCfbs6l56Bq63prEn7CwboPcNrlhWtQKCJxKiUMZRtYT6SwZoOjOwaRfRMotHWUY59MsI9
	Q4268n5mhbtpTk7xN1/qvAfgcpXqsuskNG8EVQKPxm0PneLbklG2XFHzfKAxHN5Lk3uWGmyKWMS
	mw0n6yd7TlwKr5t/Io9pQ3MmHz/4/b+GTzc605PIepC8d9wUdl5Dh7MpBJ2IDvcAECZLZtsZkY5
	xgVV4NMbfRZCYFT4VqqOpwVuYKv48PeOGz2vLNBeXIBkKdiwa8jdLjxLiUYnmAiJe77iVkUTqBS
	PGnBVH5XJfMDF7CyKzT4sF2T5UrSGjv82BecGLm8wjy740OrvaHZzWOu/8DAdef7iA4SjtPndTz
	yL9eniU8H9LG2pKz/kbwZwVYl1VPCRBkjkXz1zgA=
X-Received: by 2002:a05:693c:42d1:b0:386:b0ea:327d with SMTP id 5a478bee46e88-386b0ea3549mr3926679eec.5.1795474865278;
        Mon, 23 Nov 2026 15:01:05 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm41359262eec.22.2026.11.23.15.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:01:03 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/4] ASoC: arizona: switch to generic device properties
 and clean up
Date: Mon, 23 Nov 2026 15:00:53 -0800
Message-Id: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKbFBGsC/3WNyw6CMBBFf4XM2hpaXsrK/zAspnWEMdKaFolK+
 u8WXLs8ybnnLhDIMwVoswU8zRzY2QRql4EZ0PYk+JIYVK5qKfNKoOePsygwOCMMHrXGBgutG0i
 Th6crv7bcuftxeOobmWltrMbAYXL+vf3NcvX+pGcpcqEqMk1RHMqyplM/It/3xo3QxRi/0LmrW
 roAAAA=
X-Change-ID: 20261105-arizona-asoc-ca9bba7a3bb7
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.17-dev-dd645

This series converts Arizona ASoC drivers to generic device properties
and cleans up dead code and formatting issues:

- Convert audio platform data parsing from OF-only APIs to generic
  device property helpers and drop CONFIG_OF guards across the codec
  drivers.
- Parse device properties unconditionally in the jack detection and codec
  drivers even when platform data is supplied, preserving existing
  channel settings and boolean flags when properties are absent.
- Drop unused hpdet_acc_id and hpdet_acc_id_line fields from struct
  arizona_pdata along with the unreachable HPDET accessory ID logic in
  the jack detection driver.
- Clean up coding style and argument alignment in arizona-jack.c.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v2:
- Only parse and validate wlf,hpdet-channel when the property is present,
  without clobbering existing platform data on absent or invalid values.
- Default an unset (0) hpdet_channel to ARIZONA_ACCDET_MODE_HPL in
  arizona_jack_codec_dev_probe() instead of using the GNU ?: extension
  in arizona_extcon_device_get_pdata().
- Link to v1: https://patch.msgid.link/20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com

---
Dmitry Torokhov (4):
      ASoC: arizona: convert audio pdata parsing to generic device properties
      ASoC: arizona: always parse device properties regardless of platform data
      ASoC: arizona: drop unused HPDET accessory ID support
      ASoC: arizona: clean up coding style and formatting

 include/linux/mfd/arizona/pdata.h |  21 ++--
 sound/soc/codecs/arizona-jack.c   | 248 ++++++--------------------------------
 sound/soc/codecs/arizona.c        | 121 +++++++++----------
 sound/soc/codecs/arizona.h        |   8 +-
 sound/soc/codecs/cs47l24.c        |   8 +-
 sound/soc/codecs/wm5102.c         |   8 +-
 sound/soc/codecs/wm5110.c         |   8 +-
 sound/soc/codecs/wm8997.c         |   8 +-
 sound/soc/codecs/wm8998.c         |   8 +-
 9 files changed, 113 insertions(+), 325 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261105-arizona-asoc-ca9bba7a3bb7

Thanks.

-- 
Dmitry

