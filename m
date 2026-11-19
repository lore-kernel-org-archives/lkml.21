Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795057269;
	b=Nwm0ZlHGQI+eT6+hHLP+YtS9mnNofhqJaEW/Uy9s/eEP2ReTPdiP1/S9OMEiSSiHNExK
	 aTR9TonIXutakELeqjRKESV4NFTlH5ZBS2fFuus5AZMnLljzjOcBb3WcRfQCnTs5TIKhz
	 M/jI20JE6nk6Kk9u1N8HNcy0UfzKCjBW2QpwPAkQDny+azUqw4Wx/xmnuLvmEW2q/wr+E
	 usbO20yHRSX/wzGve//uTLRKymZ5h575+pCHX/t5AdAj96rl8SQKo05rqn7RwxWNks90t
	 E0FkcpXrmpEgZkFUbKPUBD73yI7z1Kp2deniTqrUHIfPyWA5JU3oAxayBUhVKpGOf0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=4w8GhN5mD7HSPr7/jRT4i69y1K7zgd/Fqk2kSujU6ZY=;
	b=YIJ7QT9yX4jg0uGC/he4J1u/PrNzC7LM2cdyaY0w5zDwujsREwqv42/rNIaUT0ph6IgX
	 tryUixxMVJbXMsWAbdVqgJrD0iJYsLglTUc5u5wLdU4iD76/bpq2oWEwxPUSjXGGaZJ9g
	 VyKLX2YcCoQ4AaO3ZoIq5PgA5u/LYshl5M4eHv37Ci0T4wgiMawOeIQaaOwVVK5CAbfjW
	 aOC2cHit3NkNZmBzaIz4lcTPDZpWzBPCqPj/whPYGceHtG1F0reoQVTC0vrYJgOa35kLH
	 wLkzCQiVf03eyNsYlUUxDNVuFHd8sRbTz9fYMYEYMAQVa7uDWTnityc0SEBvKL70F2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qGyl57PS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D5A60A2636
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D5A60A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qGyl57PS
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3b4944a0eso1527391c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:01:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795057268; cv=none;
        d=google.com; s=arc-20260327;
        b=XHwBGcLR2lV+FAkNgbrqdUqTpLOvfAZnd6ZBHOSXzMvo7qQI0YZmmKsZ05oNibux3J
         89C7RJNJSkPRo0WHPJFQh2JiniLcALYjlkX53VZeBCDkq0nKzvqQWY1oVemahVmvuX1E
         3ffiO6/2r4V9V5hUi5qR05nCsSbXj8EIxUhqnChHUv5thcx/PWR4p3IqMcCPGaS71iLN
         dJu4mp0GXckN16ixowAo3RO01qc9D+xjo5jmOMn2CKaHiiZZtaf7+vLaBdvHowgRRyQi
         MMmuuWNZOUg9wryqaLpAxoA/mOAFO7F4dTL+EGThOnRSrYkkwJqNiWxdhF8m3i58BWvl
         mY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=4w8GhN5mD7HSPr7/jRT4i69y1K7zgd/Fqk2kSujU6ZY=;
        fh=5vI4YMLZqtKyKxPufNYNcjXcP35xIz/rEzuxZcpOr0Q=;
        b=NP6kE6/OJRN/x/JWp7eh8QdrUrpyLMgnxC290cR1tU4OEfMeDacEipm2daoX6dXK9Q
         5Z5LOr8bbGruYWEOHC5crhRHeGNnlOZAkW3fhU3zOCizIHVvAn4Qj863XC/f6eDQpUta
         t63055wbKPufX94gMaelTBqmk8q7iUp8yWqDqfjHJovjHuVtmDtbPsTtcZiwvWk97UHl
         Ib468ppF8OqU1l4gkSa6X6eM7K2K4pjipRpM5a6FvKM7A3MGALn/DFvYraJ5A4+9ZLDG
         Gplml6zPCaU0ie6+5u4Xq/wxNJYWWnz2AivlYcX57mhC0U2Tr/heLlDFPN7vn9n8dTbt
         LURA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795057268; x=1795662068; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4w8GhN5mD7HSPr7/jRT4i69y1K7zgd/Fqk2kSujU6ZY=;
        b=qGyl57PSwCtsdthkmE8mGKl7E1ablioWbIPgus3WZwvaz358B4f7F3nMpH/9HSkSJh
         qI1FrOJhazuItFi/655BPj0IU+PPMhi2Rrqn8KlXDZKGlQSw97kymvhDkMBfwoaTDSH4
         IltQZh4JvV5dD5/ZgMzrAKHXk40kEUs0S2hqyORYzuWEYKCpD3y0Xp2EfBG2Qowh110Z
         Yk9pDfxcDjNd7CtAmSsJanK9KLRjwbZjuyhz3jacNllUAHB73PZ38QlFAFVhglh9kSZx
         XbLS2/meEcyIvwjFiNhSK6EQ/KMVXyk1FWeLiE5eJ6sACTfDEkgP8OSxulO/Po4KBw/4
         LYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795057268; x=1795662068;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4w8GhN5mD7HSPr7/jRT4i69y1K7zgd/Fqk2kSujU6ZY=;
        b=EWDsNTRTQpk7fxHmXoUJfp3Hw/Rz8kEsuw1QzqRC5eZ93CW1od90USXrttYGZyzOCE
         E9JazhVo9FUyKoOxWZwuYdoQaK8O6XIcqThTx32qO715hEMJ6X+BCw9S6k5EFnWae0Zq
         qY7mg3jpwQO6P/3tTGCuefMnjglZlD0SWiKHbasLUtZ4DZEhMQQyKBrP0ClwyYDRsA11
         d7q2YirHmM1I+p+Yl+ItBy/g90xD7xGr0PKgTYsEUUsOuatdDApOuwlUwBaQt2f3ziJh
         t7QaPxB73nccqbxgtlBE0q4VaBf9D30+M+pFmLI4bamB0ZvdcunvFMQ2vN/eCA3c4HdF
         04ow==
X-Forwarded-Encrypted: i=1; AL+hErGpQfVV70rOsubnQUHTWxtwoCF5kHpAhDnXJfzvKHj64/x264Pe3WfPkNtzXMIxK2ftbt8fF6mwi4sb1ds=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZdTMdOlixgSlVqS/Dx6ReOkPtQTwpThVhVzkKhrLTwK4Xe/1I
	gRK9Ohlbrp/sp7oVAZRxu914a/g9u80QCNk/seGiiN2PB0d9kz7fX9h13vM3hf0+9t1EWMt0AiL
	ZiunGGfFb9GHTnuNONWJsUaHm7raLy7HeJvJ7iJg=
X-Gm-Gg: AYBFou3J/nnDLWRspECBBuiHn0ySQZmiWsiK8xAjVXyGq2T1Vfy+v+M4E3jiIP7+lTj
	yRTABino6aNV2UEzqb1OrQnEsy9WZt1bkHvjZvf2E2qrXkfbvEoA+5uhxBq5qi/4PRTXlx37GnX
	5BOMUv0Z5UTbAgxPCRBe01lw8qn0qm+iJws1R68eBwezLeAOnLL9Wa0vHtMaMUXouJJg3Q6jA+m
	JPLS4UQbpuXUfTcYCl6ceppIGifLIFNQZ+qxMDXDIOIEReyHHMdfoVOjSVLMZwR+ks08ngrHilu
	6VNI9EwOT9bUEUJF0uzByaWZi+rlm6Grdv8y92rGGz7KgbHUTHQuFmB99/n9wyw32ETSiW/uCXL
	Sm85/w8drE3+ARFZnWaafGx26vUpki/HWwwQFkgfC4AiBJA8C2Wv+0AvfpV+ya0Ih/z3TuaZ/78
	9Op70sJQBZzkOA12aViOj7eH7jPxJzMoVdZbkaiH+C0pIKdCZh/6jP6WKcdFUNXNdqN24BgRJUs
	n+YZnTGb0HocXmcxXFGN3yFdpjNR6fKKWZbbMxWQFeUt+45+LPzU53mKbJI9tZmfE4pnuN2AM+T
	/L4=
X-Received: by 2002:a05:7022:f51b:b0:18d:9eec:e0be with SMTP id
 a92af1059eb24-1b543af02d5mr3572408c88.2.1795057268368; Wed, 18 Nov 2026
 19:01:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Jeremy Bryan Smith <helamonster@gmail.com>
Date: Thu, 19 Nov 2026 03:00:54 +0000
X-Gm-Features: AclHuK9nXomkhmMPmwPPA7MC9ZvJFm-hb8h2R8UJUevCW9DF2BMhpq2yU1eWGPs
Message-ID: <CAAk_qkgY_To5dwBgua8NBpUv7YWB6g1w5b2g6+BzQ5=mqgq6dA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Rename Line Out control to
 Headphone on ThinkPad X1 Carbon 6th
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de, perex@perex.cz, zhangheng@kylinos.cn, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[REGRESSION]

Hi,

On a Lenovo ThinkPad X1 Carbon 6th (20KH002RUS, PCI SSID 17aa:225c,
ALC285), the speaker and mic-mute LEDs stopped tracking mute state after
upgrading to Ubuntu 26.10 kernel 7.3.0-10-generic. The mute keys and ALSA
switches work, but both /sys/class/sound/ctl-led/speaker/card0/list and
/sys/class/sound/ctl-led/mic/card0/list are empty.

Both LEDs follow the mute state after manual attachment:

  printf '%s' 'numid=11' > /sys/class/sound/ctl-led/speaker/card0/attach
  printf '%s' 'numid=7'  > /sys/class/sound/ctl-led/mic/card0/attach

Commit 108704eecab9 ("ALSA: hda/realtek: Rename Line Out control to
Headphone on ThinkPad X1 Carbon 6th") adds ALC285_LENOVO_DAC_RENAME for
17aa:225c. That fixup is not chained to ALC269_FIXUP_THINKPAD_ACPI, so
snd_hda_gen_add_mute_led_cdev() and snd_hda_gen_add_micmute_led_cdev() are
no longer applied through the old pin fixup.

Chaining ALC285_LENOVO_DAC_RENAME to ALC269_FIXUP_THINKPAD_ACPI, while
keeping the rename at HDA_FIXUP_ACT_BUILD, looks like the likely fix.

Full diagnostics are available at:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2174970

Please advise.

Regards,

Jeremy Bryan Smith
