Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080533;
	b=NHtYVyDow3QUMNEaDpL3u95zs/yO9aiUAxssyJlDtyOxBm6khKp771tyMF+1/4/is1Ye
	 Toec5qFmmhDAx6vQAikYuYpQ/Jeu3ONA4g3USnubX2EWmt6dh9RrSPvQcRqmFGSAeWGDd
	 iFuPPXNjKHTWZ9bLb1owwnB8HmLUrhuJ+61BIvGL7QEGaBp4gEzsPsRtiLG5+a57Drujc
	 A/L9jk+unpjrGC+Isu3ZYWvYffugkusIbcA/0jXdsMl1WJWv346BXb344n5qtxGbrC/KQ
	 p2uoFUMI5fBCaLTVyOLwIiIO0HMZrHZSRz2vrh+CY0rKSUIyr0BeI6bg551uMNIaMLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tZkUVvzKQjAQWyILkBtC/Saow2IR3GnYSwljO/gw5AM=;
	b=RbJvEcsGRhHBlf5lwAbWpjAPV87VSzRbb0fVEUdCckxC5wLUMkxjcweo5Qgg+nK1+QYZ
	 ppYo9lwUSOVF8t5HeKrnAtAIYkNJz40Jokm+vccGTrBfnKlOlc46S8r6PwKpcIV8xZ9ew
	 57SMVQrQearAdngL9yBqn1ivu21hFFcliPRi9uQXqNNwT4jd2eC9b6FPdRKZRR9uwsfg1
	 ZfSmnJrExaUEDKskkFuXQ0LsDJZh0fWl7YJsms3nplSprT5wbDuCNgFrSMdnB4IA536Hu
	 toX1EOepZjoYsXOt/MzeQjmm6heSxWKgc7jt0mUGhD1CpYtjv/8fl7KueKGpgVDS3JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UumKtnKq;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C91160A2602
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C91160A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UumKtnKq
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso17878275e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795080527; x=1795685327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tZkUVvzKQjAQWyILkBtC/Saow2IR3GnYSwljO/gw5AM=;
        b=UumKtnKq1r1pRhIl6yN3F8pjsM0G5KjQIzfv66wmuNMsafvdfYcIvwZLRI7bgvZI3l
         fY8Xuqe8hmWICS/u3Q2opwfUW0L8HY6EvYDkC2N4oETy4EMyjhdRghzi7X1M5T+tKebS
         4jEDibCvEWME+m5xzokpHveX4G/HRd2ia6MxTKkzxtWoxLBDp46iAlThBaa2sZkOS3vq
         k0pyyP1IpKzrTpLWRUoZT8W1TjvTsnvldczRKXb1GniyYK9Qc92sUJGm6W/oIg/czk96
         ANKJ7WEZ+VMZG2d4K2NK0nFKv54Ngkd4XaCVytJY1Xy4yEEpB6XNZMec87d+uJodilGD
         Aavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080527; x=1795685327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZkUVvzKQjAQWyILkBtC/Saow2IR3GnYSwljO/gw5AM=;
        b=FAv53Lxi/hSuen4ISFzqKuI7p6XugYNfoLxGQnWf9n/HVstdtc7yC0OELXSIv3JDN3
         ECyoW3Dl5IsfUZM8ATYj69Z8sQcnYEL9mjez7n3PnAhDgcUiL6pzoIsjCACU+cS9OBhB
         odQsCMbMh4BNEZ2k4c2ZWYVhwmqsI1uL+CmNW7ui9dHwf7p11PZVtab0k7N6Ij6vM50a
         mKZcCK/zD3ZyVV8iDmTteAkEY9rYZZnghMBWkm0V1viNx1xf3FPkCp9w/6Xlp860bjCe
         9uQq6Y6/4c1c9JzN1zM52CYVBxGzA9mjdgutejCY6AgXiE8VvfRwV0zhRJNXwBxa2etl
         u74w==
X-Forwarded-Encrypted: i=1; AL+hErGcHhpnJPYyDlwkS3FgmovJZRIpl5QlUvJceJXY4RofniVImQRNWqcrSeWhkWOAAHIXsBumN0d2uayk4SI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KdDmNEyvsnbh2Q2PNmMUjhmgIijTOqZSmZ2hYwUg88kNRgod1
	43Yyo75Ry+80D1gpZIVJTjqwMU/asMVhNg/UL36qxrTIBLjcLDameZcJwW9pqQ==
X-Gm-Gg: AYBFou17aCirujFCrOsNfF6T2QGRGivdOpmjwa3xpjUrqq5DS3uTmkVtCr1zErx5kPd
	ZZHr3eiCj3kmA70sQ5WRnK1+i2jkhoCd+8OxNvumg97wn+bsndATyzz/yUv9V5irmLuRcAIPTOQ
	X154hKMW/mvKPc50bvLDvUlqWxkfpKW1xMKXR9kEyXJbypBgbSBI1PrtPgbzzmDHJv+OoVla91/
	XpKn1+kE2N9S+UawM6agGJ/bw/JWMa5OLzpNDCtCbqofRfW8wlYE66BMN3og55BbLPUqgySJI+H
	iWMRQpqxo6pfewbYwMFnTbIg9TVRUgV3uSXAVqQ2NUb8u1kn/wxA4EbsS2nZKa44go3IM2msP7z
	p3uehijbzsWE3otmjk7P2/YSu8PRbMH3HThNHPFYolFsACnqh5Gr+dWYIMww5ptrelrtzrTzq3z
	Y6ulDLY9fpqVN4zVVvYEd8Z8e20fGwIlyNR3clgTceKLdwrwicm92NL2aBNwwrlVa+1Hyxpuxzw
	dJAtNlTQRhiwpJ4iufpMaLlxBh8yt4SGwtUqmSDFYvcWxap1ibvRDiwEpCo7biotG3stiG7H3F3
	6U/IV76KJ4kp4PB9fwrO6vF6JbSp1+BF8AcOpUHKJ8nO7/uol8dUsA3/PLahSK7mHFmIlf2LTZ+
	mRNuIxVTj/keFWzOYaTl0BM3jRwbeSI8x6QT8BCzEK8SjNJsMykYGeO0T7xcssQ==
X-Received: by 2002:a05:600c:4f14:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb7d6cc934mr120234985e9.1.1795080526550;
        Thu, 19 Nov 2026 01:28:46 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3c6sm8736002f8f.19.2026.11.19.01.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:28:45 -0800 (PST)
Date: Thu, 19 Nov 2026 10:28:42 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: freescale: imx93-var: Add Cortex-M33
 configurations
Message-ID: <av7BStmo7w4_rPci@Lord-Beerus.station>
References: <20261119090600.9257-1-stefano.r@variscite.com>
 <be20af64-e729-4d1e-aba1-c8512ac6e775@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be20af64-e729-4d1e-aba1-c8512ac6e775@oss.nxp.com>

On Thu, Nov 19, 2026 at 11:18:45AM +0200, Daniel Baluta wrote:
> 
> Use "reserved" instead of "disabled" for all the nodes that need not to probe
> on the Application processor because they are used by the M33 FW.
> 
> Also, instead of disable in the commit message I think it is better to say "reserve".
> 

Hi Daniel,

That makes sense, thank you for your review!

I'll use "reserved" for the peripherals used directly by the Cortex-M
firmware, and keep "disabled" for devices that become unavailable as a
consequence.
For example, Wi-Fi cannot use its reset GPIO because GPIO4 is reserved
for the M33.

Does that match what you had in mind?

Best regards,
Stefano
