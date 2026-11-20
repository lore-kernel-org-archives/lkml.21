Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174452;
	b=UyQDIz8BuoGsd3xtVryFkxPi2Gk9u2Kt10BQvx6EF6l/hc/Eu+0OnldgGfGFFeYG2FzF
	 9pxSiDo0FApmlNeKN1I20KMz61Kzxkxl47Fxf2DR9DaLVqPeXY2PKZ4Q6//uwBm9MpzbK
	 JfoqsLD6b5IWotKuns9A/s/UmQP68/4019ph2iPZD577LPLD1jNoGq97l9maahe05iSY4
	 iGThM5OTZ6uKD6CW3SOWCTqFfAvaZWyynDLW2SCOd8ZIdfh2s9CLj9fZEJZp49TIZv3RZ
	 PGWxSUo45r4fkd7t5A+eZETa61Hw2vWj6FCzoP8xDPOIZBJ0nm5i/Ow8PcJZxglJqGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
	b=45++R2JRenrVrG89XBCyVuqJ9uvfKdzva+bj3SPrlmoqBzeVmXvG2d21BEy0oCGmzIu5
	 B0DKwdDeLt92Vbo+hxZka7DGsWQ8pvGWysxEr4bPDoTfYQGEHnb8Yo3pIeEbVQQBaRlql
	 wVM+SoDsTBt81xDSFmdjUYRKz7HJiSMXV+satUrIqZvsuxFa/aItjMVzTnggiCZgwlQIL
	 QZJ/2uwUL/IPhgHIC4RHzWmCCk/dyUoGAXFq1BYTFZSvXrZJET1S7IJkwpzJWSvvm5JNs
	 s0uF3KUDIG/yjrLDwmHm6D+xDieH7jIOEQwbB3AdntEsdOjm9+w4zaIF9teWmmSFaGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fN1o8DTz;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49B3606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A49B3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fN1o8DTz
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cddc250d815so315212a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174451; x=1795779251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=fN1o8DTz8saUJXAI6UDM2wPcHyFeJeG8poNNyE4LnUesELXn51xESxwynt+UlGze3v
         zHG2oR2rTTiuoUX974exUvSPmUQQnNkydu72xnJu7SwhHh62M4i9rz1ctq+7nUbKbCl1
         Pe7toDAWmf+cm7p5rEi2XLL6qOF8nkcZWE1N6gWzLCLLmj7b67x05Wfhbqh2kiwasHwu
         J11Tfhp+rblssB8m3Qgm8W+7L5eCPyFQ6NZZW96aMCGPzHzCH8OTJ5OorYL3xvwPHdnF
         jDAtzG55BpDc29Qk0xk/RAab5uIcRcrIT0i/2rP3Y6up5LloZFot2JLWqnwonk9+6rzA
         7Jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174451; x=1795779251;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=XPZOc95FFeLyO9NhNddG5yl/jylTmsMbLxJJcd0EWcwumQgECbVOYCIs3YkupzAiNl
         A1JF1Xqx4mSdks9lD0aKaow/oLnky0GUYoZebQXdTrVi9ew0oTLYkDE4GI/aC93wEBzE
         nm+lPh68iQJ/xmn9pzzk4ZmAAwdz6YCKrydO5kEHg1BBRy6Z4x4FTNgb7yZhRk4z7lWy
         23pulRQsJQvVL++L/j7JWEyF4l41//llVrJa+jIMLmR60ucL6uWD48rvonMiclbWmooi
         pzjjTZo4iE6+TrnNkGF3SvHRm+8wMM1J459JLRag3fTxbmi7BmKq1zzVsfxodMinfsvz
         qITg==
X-Forwarded-Encrypted: i=1; AL+hErH9eI4SGBwDC6Ys2egUamhsyBVvkswfWXQFN8S+xkIyC6DcLt+73wEHzCsM8lUBrOrN+k0vmSvl8PxTBo4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eGvI0jOHxj2mx9bGql0L5nglJo47ZrL1mRCnfUV4ehNxzPP0t
	d1AjfdmJri/mM5cf6l0Ap9mvCUEa12/0zpoqUwwWVaYq6QsDI3jPBYhGg4SvY3urmKxRBxrXGFp
	ADTqh/mM=
X-Gm-Gg: AYBFou3rMye5+luXQpv16iwrc2rhQgHTHSjRQ8OawLowpDBDuaCeqesiXC20ciNb9kW
	5SxDHX+T21IwRYWFB8uRdlpqCjffLX1+SZtjkfm7Z/JYyl96SX9j+Y1/VgjIlEz89FySZdPtUCA
	3tcdmtrdYiQhMabo2cBq6iUHTlfYOwpEY43mNsW1hgv5v1436KAOlKZCwAeRIV3L6shbwyMddEK
	mi6R8Mdqzjjr2r3OHMIp1o7wqoDEwh/Ye0eadztACMtFnH0ph6Yk/4D/1FQNNkHAN94GIMFXmwM
	k+SAy32f1Pcnoc7jJ7QsW0uqEgIB+hzthzK4gB4ExBa+b2VwLPl12HKSV8Uj5mWeZGWvEfZsZ5l
	LsIph9DGSU1RRxeEZAcS0iGa6CfTLuH7fK/bCHDP8j1RxwTK5VHdNCtT3Tfyne1/L7pt9HBqslw
	eSg5iaT7e/aaDEWgVSjrTVqKNDa97T3QRGpQ4FsqLE8r0LxunG4HKSoL/K0BrdJmfZJ41U+gShT
	f8eoFivfFzDODocEIoUYJvEtSGVztp89Dri0Pvqts9eDjtIuG9p3cSIt/o3FhXU36rKPL9BpOcH
	HwXKHzN9KgGLVkw2nQW4ooQB8XnBVV75PfusxmxmmP9mLVJY8aoqdAMJW6QDBpNDoQt3o0KQtUG
	bFA1mmebIU8wIpE8qj+9HHoheaa71ZSz/aYBJ
X-Received: by 2002:a05:6300:95:b0:3e2:b85c:4b2a with SMTP id adf61e73a8af0-4014ef51c4amr2831753637.73.1795174450911;
        Fri, 20 Nov 2026 03:34:10 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm1139702a12.28.2026.11.20.03.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:34:10 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] usb: gadget: f_tcm: fix a short write infoleak and a completion-path sleep
Date: Fri, 20 Nov 2026 20:34:02 +0900
Message-ID: <20261120113402.3069090-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013062129.2568405-1-yhlee@isslab.korea.ac.kr>
References: <20261013062129.2568405-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
