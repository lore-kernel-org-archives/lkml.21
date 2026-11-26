Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682769;
	b=ihSB7o2C/icB6tSRhue3yGsJgkUTL72dTtEXzzg4t4lIFcic+uyGpLjR7OWYsEG4iM96
	 5kUd78xG8Zqo0wbRDHbxy6DNVMcwdrWMz3ph8r69oBM3twAQcpmqH2vXXU2jrE6xc/szT
	 NvEbZS0jOS16gDTZvS/I49R4BhqNMEGuLVT/eDeVXfMfLJ9Dfmb+TBF0okX2FXbNwheJ0
	 KbhuPp2btL50/4V6+b+JacyihsBQBS4/tr/bFAHR1ec8ghefpsOSBLfreGiUzHtkfCkoD
	 O9rJW15pVVVFy0v6XdNllM89acmOLRYCVdld5D8Cqhp0PhdfcC9d30JsZgDoZBRApqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=jIjy7oXjqNe/7gm7TLs3AKZq0G6ZEoHOSp4CNqXrGfs=;
	b=l3fC9Bp5OnbrGUpHnMHZH/CzN6YMJNUnwt8lpGHlQXw3fh7qSFxJ7q8cT4tkf2nnq/EQ
	 /QveA4SwGsx0xH5om8rkZhCjMONcITT7cSnCZs/7gKLinnOsl2liXZ87rHG7xu74N0QKY
	 3vvhFBzJDVYlqfVorANDmJnCcZ9d8WjSiR20ArRXtp6tkUnzsHaAPe3gYpBV50XTfcEvi
	 botCn5sAOCiTRDygN8VzvpKcioXy0MWz/FNfH0+8thl7TEwElWV0155FEPQvhP5sd5fgT
	 NiqjwqkwO9EcZRQtvrcEBPKocjMH4mu+VqvfALdNs1b0TuLWNqOGLElSnDyrm35Guyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EfLDrA5O;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642A3606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 642A3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EfLDrA5O
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so218470c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795682768; x=1796287568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jIjy7oXjqNe/7gm7TLs3AKZq0G6ZEoHOSp4CNqXrGfs=;
        b=EfLDrA5OwNXIvq6n6kx2yPR6+jKl4+ne2z6pNVr8F9YcgTVn8JeclvRCEu1sWR3oX1
         VwHbStjZj6niPnXHuJL8iXvCwmysm4Vqi8QjBhzK6cPHRux/RUzXYFqzKsbyzqOjotV6
         Gg4InTBiflxoC56JIYXH7wxw+eXaOaure0yiPo+J7obe4QDNn/ZwcofibZidOXYe3LeX
         sL5tFJ8IqDIrFGlG4oWkWiQAutQpIwpPZUOL3pFF/cSL5us8zQZyj0et1Xx6gCiVIJdK
         y4/iOL6MhS2ktD/b2wf6Xojdql1tDRFSb+Q6HGdqXBHJV6827QAHigUEx5OY///k4yOr
         YD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682768; x=1796287568;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIjy7oXjqNe/7gm7TLs3AKZq0G6ZEoHOSp4CNqXrGfs=;
        b=E6a3RSsYObpZ2C0g6i26GrmH4lg+1lZJ+IprrztUL7uiv6DY56qIi3P2O3nJ2aCUBb
         iP0YRyBvWTQ19vKuTs/DHnAHrgHpM0X74n/QauLsPEGQZEx3ra3NVJf770OLXIa+oPVV
         Cgr9LFuQ8bgWLEbDGqBnGfRGp73UdZsuT4nwc39UawYTz3yZifqrxyboHI2iQ1QqhE6a
         U555TVISEC7Z7hDhbUotwigbWNwTR3sXKKXENFwuBeE6UCtaj+F21a+5Jh+Da3d0jP3P
         SMWgftmruDYvFBd6koj++QKUtvHA5OPR4aER7m+atxH5c0uRlCu/EcC6/38MH2TM3HQF
         Td2Q==
X-Forwarded-Encrypted: i=1; AL+hErFx079s6UVvxDO98mVWhB9ynIxLfMj2S3yfJmvIBIdNgaMKsW4u/c7JNROaZqnKjXO+bfBt8khyyBjRB50=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R0LlZfwIAQJu9qL7rBeRiMsJhpdHsNwp6+2jVauWnQbPcYtAa
	iwODPpf+opZJ7hWNm7wuabEtu0gNAIErpBLDsVtGTUDiVAtP/ppo3+0/
X-Gm-Gg: AZFdTZdsgF3EcikCQ5G6AUrryOmOJV+STOS2/jpmjYyxtBn/+kre3yrspJuUocSIUJ1
	9p9z6DHjbxQym3Zu3NrKNXGIW8lwXmXZoEuQM25Jr3ciUqgEZm/mCiL2ZzSqLEpeER2a64F4naB
	VOKBUc15PNldp3xawvSoQls53GPnm+YqfxBKdUcv45SYmMWQdj8MLA+oat5nqvqQq8ItpDyotD4
	+Rj2kXcYQtE7/lBG4UDSMFKwu3PxWyPpaoZVY8qoZ6kb35y4s+eTeJIJMtCHIT5Q3ZG1CeuXqa4
	YVNY65JttXiNucJKRCGsiusDZmO1w0Q0HNKKq4k+Z/0Jvoi93i+2U12xVj6qWsmUV6QWQIIRpL4
	ZP3E4kFWk1/mscEYaSjINg4eBicvUFTGY/hs25fUWAIxXz43Z8sO9IGVZ0Xgs5m/sXDSJ4Taa17
	iDD4WSbbLShCRWKZ18konJBcAfG9mcZQM+swsbwHXthpLDoSymacWpsk51XhkDj2BxbKuOoZWn5
	IrqEktsj5afE3E6mrg1qLblyr5a11qNnmmLnshKvx5IpmgWaYwSTT9Q0mzLaOXiziQ9P27uTCT7
	WtuIz7825lRCjiz6/G42+eGZA7s=
X-Received: by 2002:a05:7022:3f01:b0:160:90a3:ca8c with SMTP id a92af1059eb24-1b55689f73amr22735281c88.7.1795682768396;
        Thu, 26 Nov 2026 00:46:08 -0800 (PST)
Received: from [127.0.1.1] ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm71200574c88.14.2026.11.26.00.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:46:08 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, TAKANO Mitsuhiro <takano32@gmail.com>
Subject: Re: [PATCH] vt: Escape the CUR_ prefix in the cursor kernel-doc
Date: Thu, 26 Nov 2026 08:46:06 +0000
Message-ID: <179568276623.2784380.14004398028038099132@gmail.com>
In-Reply-To: <32321472-2593-4a5c-a347-952188c05333@kernel.org>
References: <20261125182903.2396749-1-takano32@gmail.com> <32321472-2593-4a5c-a347-952188c05333@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py

Hi Jiri,

thanks, and sorry for the noise.  My duplicate check searched for the
lines I change and for my own subject, and Randy's v2 rewrites the same
three lines in a different shape (%CUR_* rather than double backticks),
so the phrase did not match anything.  Searching by the file path would
have found it at once; I have added that to the check.

His version says the same thing in the way the rest of the file is
written, so please drop mine and take his.

TAKANO

