Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795344952;
	b=JnKaLm93MvoJY9qiiIQpR1WjwvNwe0jRnR/TRls0RWkn2TCKMWeCY+Czwz8ZxJK1H2hf
	 Cb8E+fgTxl6VvNSc8mWXtuyn9y/ybr90/0BGeuEEssoHIKCvt6WTB4ZKjCqfQnS8CNz+r
	 n9keRq7mmVL9TCHRl0cA1q23DPQOLDvCO7uxfnJMikutJz4gCcs92FS0jQ+N3p7u/fbNm
	 w0FG4KYDWMMYIoCHc88Sni1IvrvqzAV0Ta7//QhKhVUbbC8DXlTT6uHDB+xuI4pBv4/RV
	 olOT835P5NwjJq4ZhiOIKGXxw28pqC6ADWlIYHcVCvX4IWyTnN/fkZIZWlMRDiu0S9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795344952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=a0xLo14PtGxycyywLArSvreFVvadM6xesLJdfHk84UI=;
	b=uYtK7GPyqbHSEIJiwkip2ve/+5JAJ9cMIcwKT0f5APqvMZxb6exPbZdbDE+WjlZLzHXc
	 zMaSiqudkNY26C1AmCSVgv6Hbw7QZRuvdqlVOsMX8j2khXOXIZWfcmnNNnnfkoXpGr0NH
	 aCC2rtLmX8XK9PbxfgER7ZC9nonEcwE7hGx4LbovOSWFiT7gD24i9wQjWdK+c4izLnvue
	 QmsMTAF30KF79OzwxNCzbYw4D3rDL3rKtbJq2UP64bM4+UgFCY8sU9lYZHMVhzXe5klm2
	 SquLPOKLPcnXX592bEtkVGCKvgRCgfKa/1DLif1UFLrmh7mI2em09ljQ9wWIQXiLX2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lNwXHh3z;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB38606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CB38606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lNwXHh3z
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so21024585e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795344951; x=1795949751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a0xLo14PtGxycyywLArSvreFVvadM6xesLJdfHk84UI=;
        b=lNwXHh3zfzPpw14YDlTSjgh96AJTrYHkCnLo3alU9+ngcDECBYfnlr9sN2twL4XXRq
         5BpWoBEW9iQyBtOdg2ePB0/U5/KmWdyWCikXzhI4gFdqjxYUm6Es/jArPFjIjMlB+e63
         T1QtX7M5+4S+8Wyj+2+XkGy/tbeBtnNdGC+6AQWadwWHVrGlWae6XSGhLDhLrYvJL6FX
         9EpeJMucXzoiamGcmtCV9qG/WyjssRQvlUbkVnPl9wjSyrE1YBiWXZ5DZRYkdPNIA3My
         jKrmVb1Tag8Bzx+Gs754REQY1i2xrCG5AWORrYS05HS4HFr7AQ368jHdaRnkdluWY9Ln
         nLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795344951; x=1795949751;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0xLo14PtGxycyywLArSvreFVvadM6xesLJdfHk84UI=;
        b=mYi7+Sk8XirWRQLNX3y/WnEw001pQcYLNhuEn4GUdz3xjYDxQa8T3cHhNgEIAK/qGF
         ujD3cO4lv/HEvS85As1Cfr//iKzRnqoBZTUPmBS1nvx5G/LAjSjNqQxr2QKS6Ke6J9qW
         RGpv1KRFfSjjx0Xxxn+cHiuqAyw5LhMc7fCw/tKzFdSwm3sqrheYN3VwE5IuD0Ykh3ur
         pNVAarVTT8Dzf7tvjYib65+3s5Rveckq/LUvuVpyGdy2ipRpX2NhemqXV/pNkw2gDgxD
         Hy9ly17BKDZgyBcdSFfg0tSb9+oQ3FXLbh2SZAVJaJtblJCqBQA5bhuTzRpNWVbQnUUK
         nEiQ==
X-Forwarded-Encrypted: i=1; AL+hErEAbSgnCjqKyuoXRUYb07FRp1YjtKohEzDwk+otDZUoMZ4Y7577AUDnTIBYuxG2QMz6c4Pw37xe0xGI6gU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LXt/CrwHkmk3Fneby5Jzn7KGIiICrPM892gzEc5nJjHLRqsZp
	k2X9t1YxP8/O3KVlF2zkAj4aFg+t+y/x9+7lY08N8rYBnip4qV7cwpX/6CQNEA==
X-Gm-Gg: AZFdTZeIxhk6Dc+bXlkv2FgQgeYWei2vdc0aStKBiTcB8ujIsevGflpeeKyU+7ICw6C
	xSeTg9DtkcgGSsR6HiFWr/SKP6t/2SGcWERe2iinSibcb7HFVQLq8cpJc8DntQJLDcViMRUu0MI
	J1C/dBuuWO0L/ixqzeRxE6adfcGd5fqOwmI6xnTEJvloiGENJ/lgVslImmDuYXz2s0JS3Djf0nl
	3ZN9ludWJu8hYWAWxe4GazcBiXchUei5HWGlazcWrgSSmHOx4QUXHCRSBQRd1AdNtEey1b+R8QY
	a+UwZ3alKloN7a/DPzGhYhynDxWXJj4hEH4pY7rLaK9NUD68uJXYj4BZd+K1aWWwMjF9BVPpyyl
	p/lICIOL4mR8X5kxQdYnt7DndG627fPTqisTzxjdFQu6Ml85qEaA8+kzjjd5liffQSvpCrO9nFM
	z4BUBg8zkarI0YGHfpFRTz4+QtK6+ig6VMXG+VwagLFk0+kWW5vt312J2GfSIlrdX45JY/CTW+x
	4o+GAw+ERwjAmy/CV+XVuzQxRBWJf6sOwAe/SNoCv7JqfO/ZUMTiHI/40VYhbHcotCK26lZ8Pq0
	rTRqdknjGUvBWILIrA2PBlbTAJdYM5s4yP/Iu6+tKm3lSFWM4mQ5yZ813v4r74QhCuxJRikvL3o
	qcwhMQlBzfW10
X-Received: by 2002:a05:600c:674b:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb8892c0fcmr167070605e9.20.1795344950469;
        Sun, 22 Nov 2026 02:55:50 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:a189:e169:38a5:6f86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm111316355e9.1.2026.11.22.02.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:55:50 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] m68k: Add 060 PCR info to /proc/cpuinfo
Date: Sun, 22 Nov 2026 11:55:49 +0100
Message-ID: <20261122105549.84343-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119123558.2108296-1-daniel@0x0f.com>
References: <20261119123558.2108296-1-daniel@0x0f.com>
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

Hi Daniel,

On Thu, Nov 19, 2026 at 09:35:54PM +0900, Daniel Palmer wrote:
> Apparently the rev6 060 can overclock to ~100MHz
> but mine seems to only manage ~60MHz (I wonder if some part
> of it that other OSes don't use doesn't actually like
> overclocking...).
>
> I started to wonder if I actually had a rev6 and noticed
> you can't see this info from /proc/cpuinfo right now.

Tested on v7.4-rc3 plus this series, with a multi-platform config
and with a 060-only one. Both kernels build without
warnings, boot to userspace and run fine.

# cat /proc/cpuinfo
CPU:            68060
MMU:            68060
FPU:            68882
Clocking:       49.1MHz
BogoMips:       98.20
Calibration:    491008 loops
PCR:            0x04300601 (ID 0x0430, revision 6, superscalar)

Tested-by: Paolo Pisati <p.pisati@gmail.com>
-- 
bye,
p.
