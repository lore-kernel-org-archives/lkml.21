Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340243;
	b=H/VqFikgCGo9gOypzzefC1jbzyG6hw/WpXtaaxZTgACLnKI3+O+sXX6RwYllpJcAq9yC
	 QUV2rer6E5h1V571qYqrxdT2VEaVvub6GsrPiIu/Au77hO6Uw5M4yrZUJnC1QHl5jjVCP
	 vx3xFzRl4gYh5p3rpY446pzlb8mUntOgVFqVlOVEbCNtCpFk7YFHDEOGa+f2rWIES8tZD
	 zw1iO9n9xWN3SnkN2HWabaLOrLzrE6nHLdes9fuCnQo0avHdZWFiff0QMB4lrBHvBBp0X
	 32R/Eayx2kVN7P7AJguP1/YxVJgZOQng17e41H5PgWBgvzrvq/P/g/BJGsqrhVD8V+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=0O70Q7pwLusshInas4sUrkw+Osg9GoLbcJc1oYS+7u0=;
	b=eyIY429JXkMBhxXTw7n33HgnYuM451ORE6YavaCROORlSJh940wVKasRKNZKT+taRJl2
	 TKReUYARaQGAvASMAFqaMhwe+7mIPbter4YJZ2UwvJ1CEVOybRbgiy2AQfCc0Y4OsdA2q
	 XEWSM8PftA4GwP+PGmGD27k9fx+8B/UF9bsjuRAApd5hJIPov3UlJt4s1V8PV+p7E9ls4
	 kw4Wbno1elUUK2gr5m4mBorJ7ia//hFnK/cccDw0j5h46Ty41+SNfSC98SInSGExChGEZ
	 J2QLW1uUyLk4IAvJuyfbxcVVN5rYB2W1ChYKuouW77uGBwaFHNq54GAdmxmTMjUyy2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CSd6iNgZ;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC987606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC987606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CSd6iNgZ
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b4200f59e1so260214a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795340242; x=1795945042; darn=vger.kernel.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0O70Q7pwLusshInas4sUrkw+Osg9GoLbcJc1oYS+7u0=;
        b=CSd6iNgZwMRdMIpKElggnjFyr+SaXv2UrhUL0a1aNghamLNZJ4mM+aOxZ96cMtfkhK
         OTHQQ7a8WpsfydVe6ftENotB0PAJ/JB+mso5AoKg2HnDnCtF3xCkRrfO6fdGtTOUDrQ2
         LPQMeBcn4zOr9I0Bu8c2edRtb0S3J8+RgiaUUJl0XT/IYiCPyaS3aVvs4VQ+Q1mMuz+w
         88ze+sGxsvXDQPvqus/f4Y07fIlq4HyBN8HbWR9vBNJ1CIcoItFd1znbeqT7wrCeHmRv
         Q9RRKS5WtZ451mq96bcuMqRFAg52jJ28dYRO8AGzH84nObAq95r2SBy3BQ4d4Um5OKR+
         T2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795340242; x=1795945042;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0O70Q7pwLusshInas4sUrkw+Osg9GoLbcJc1oYS+7u0=;
        b=XIK9ss6XctRIwveTPJKDWjWqYcV+Tbl6BvUacZkGXdCJRNGsNSkHtbJMaZ0bGd+Bfi
         BNJdmY3K5w6DqOkZS0fdFmiwf3N+8KLCbg1OxtxVNTqh4vYCZx4izjPKmvW/srOdkkvj
         Kf7NAjX7nbrtVqUOn7SQGDoS2SVsbgRCop8oHgan3JRA2A6KMAGdSm3sJxeSdbjdrNPo
         dmoA26jSSu+rd7eDKD4q15SSJNeoFUfCFNvQTmbMP4fwUqhLZ0ByV/478tycGEEHNuJW
         2pYEOMSuFQ7OH4zp13hKP6BsS3Me0j8cP3XuQdS6H6ex/F76OwoK0lCHDR53K+FpG/dm
         vGiQ==
X-Forwarded-Encrypted: i=1; AL+hErGhjwfi24AHor9jT7E+Zdp5Yrv1jZXG8oE9kzeF3rjDuNr7YB3doNOow22/UwC9p7LfmofcqHzLs7b3F7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bq5o5eYBH1MVCJJ/fhhmb1an6Obyshst8JHFJAIPfd9a7Qiqw
	SpemKWRRB25fWcwHntjlRnjVLvTbYcATHBAr7DcfGb7Ph1lgzky5NA6I
X-Gm-Gg: AZFdTZeoaTowaewWOl9WRitZVOn1e9daZvotGC57kSNezudkKmFMsvQnfFIigB60Xsm
	++srh1K1zSEDIvgJ1PTgne4rCMGH4qbOX8H9DSDIBN7R5D4knvSM511MfxWX54e6Up5ix1TYv2C
	yPthT3Dq0Qs9KEIeSyAxy0ELNb38AA/gjtQY70Q7rViaN5lQT3StV4NaSJ9bvODc+nUhkotuTjX
	JTfUrjo4lp1KPfEWvNP7xMBOnNyqFy6jRIbiEXesv4qxAh2zNhrK2PsFLLCK9RJB1r/y/0UN522
	U9q/TfagrLtfVsnIG7nE/zthh0SelRdBq3U8B38pcHQr3rLcdSv3mPUGSehzS8K4dd9eJ5nzl7E
	4bp3/clbyPBlyD7bHRUaqPsvmrMnlj2Us1oDBMX77fhMiyKWuaFFG9ahPuJHtvdZ61nFSbltnvm
	61jpsklbf3U0GhNxA+cm751ul4hHPY6xXf+4pCrx8vfUECzSiYodjTtuje6/ugd4SNn27phnRrF
	fylabUYnsGHxocnmkegDSWqkvp6AsgVbdFhlG9qAfNufX1slEhxQ/rsi/CpJ34jWbcEAWabxxqq
	VJEbJktAUdHCefn9XR7yjCQsTZbFoZpI1AlNna1Hbey3wLStCowArz6tt6doAoO8hxmUgGp6km6
	RhOLE5ZSO5MotGk2m9VlYCp4pULA=
X-Received: by 2002:a17:90b:2ecb:b0:3b0:9a3e:bf8b with SMTP id 98e67ed59e1d1-3b41c98a1f8mr12481111a91.6.1795340242152;
        Sun, 22 Nov 2026 01:37:22 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm3367272a12.12.2026.11.22.01.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:37:20 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/8] serial: 8250_dw: describe the Allwinner H616 and
 A523 UART configurations
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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
Date: Sun, 22 Nov 2026 09:37:19 -0000
Message-ID: <179534023971.231108.3039673113639895699@gmail.com>

Tested patches 1-7 on an Orange Pi Zero2 (H616), backported to v7.3.3
with the two prerequisites; 8/8 not applied (no A523 here). The UART0
console at 115200 passed about 700 KB out and 350 KB in with matching
md5 sums and no frame, parity or overrun errors. UART0 and UART5 come
up as 16550A with a 256-byte FIFO, and rx_trig_bytes 1, 64, 128 and 254
set and read back.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>
