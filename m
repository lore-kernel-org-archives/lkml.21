Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795756462;
	b=I6mdeFZWMaRY2q0rBtexJnudYsUzfWaeCsbytkP4A+x//vgho6ZvgS3tLg/01hAtX8kR
	 obs6GvjfrGHjtzANhdyVdmOoHsLRreDh6U4yK7N5Col5pYTo55JnPVvd6M5Xziek8J6ij
	 BiHfyNEJWilKSe9o5AFZaMz0eR7EtAISp1KvN3o5b883/azPf3ZQYZllEgMt1wwczDmvB
	 LHjR0X4vbRW5UICYf+glbUsN/q2I/toDzF5Kou5MZJsS1seWamiZURE0wJb3IqQCCl7jw
	 GmEJZMhHC5j+/F9TrChLSV3WLMBvt9ZIlo7rTPhGR3h1IoHwipOYEwxN9HiyzfGM8Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qzV5IimzsJbOvJ6sW4aUy5Eksg3lYZKwTkqSBUgFwOg=;
	b=wDbCCAdSZaAqPm85OcJE7tT876SkHPDLtTOpyd/62ptFPbP2FlcEHhfzekenDIfsgxan
	 ypoIrWYqwHh4U5nArRc3F17f+buUPw5UHfXVGOxr0Fn+PuaH/oIBCjy+mnJnwMcVu6SAC
	 TgFFuPJqGUgG09wS9p0qVx7OhITT2zlWfm1bt0VEKvzaYEjkBr5QOTrYtzjZBgzrwavob
	 9xQu9+lfMyDoK9Hikv5VPV9VKQ120DWJmC+JA/s6emKbaxVZvupn8K4dZyf7gLGihsQ+P
	 bJaEAymEHMxuj6C2qryX5HODDy/Uu6FSRqY3Oc407RE4PTqHbObYFvBGSkF/U/J3YwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRlvPmNd;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EB4606A330
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64EB4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRlvPmNd
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so69623405e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795756461; x=1796361261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzV5IimzsJbOvJ6sW4aUy5Eksg3lYZKwTkqSBUgFwOg=;
        b=QRlvPmNdghIl4U7Rz1BHAHhkt0zKYanW0QPXUPIwUseORSCsqW522IrEAKTIxHKDGU
         +C8phOjyC6nAl6NebLAZqP/e+VkriS/8B8T2rj7KHrstoNWAXsVwP5Hte8OXU3xdi8eK
         pXQawKrsTxKVCNs0lKePbgFksNvRThrrV/bFA0RvtgZSmpTX6Ibb31y9R1zuD/OaOQuF
         UQHkDnoEA0Xlo9AXibFS4vDkcmxPFWlSOSNPizU35NL5aj8EZVYgw7n+VvuFepgiDLBk
         vHIAjzCC+oJA7A18TROLqQPNVGSocy6lHHpbqV53lpffT+460/EGdYPcdiTFOfE5OZcM
         pTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756461; x=1796361261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qzV5IimzsJbOvJ6sW4aUy5Eksg3lYZKwTkqSBUgFwOg=;
        b=nwofwvmtd9dx5H8LxFmdNYHNjLXqv+bG0aL0rCmZhP0+oVtojvRx+ZzTDV3dGdkFvD
         2IdfBU7nGF4xjaV+C3sCg5d2zookZjH9D4Qwlx41lX25MeCNN3Mbdnm1IBnhhQXkNDBS
         +PvIdJuPJn9Ml7MfsxKA3W/ti5Pk5K1QMXkAFWylECe8FTpqv3ja7QmX85uXkpPcaSt7
         oVU1BrY3x5KarnWqEDRpr883KynJp7XYc3X7TmKYj2wkUcq/hDw2TJscX5fdij3U0aeL
         tUAFDA1Bta0x+OlCoJOriL37WPdWo2EOPUcsYTGYoCfQB91iasNXqbrjmoeJ+icwE8kx
         sC5w==
X-Forwarded-Encrypted: i=1; AL+hErFK/pV46JM1WwFwrl/pO+9NM3RHWQ6s/2Uum24Jb0jeHGHsdfFqwBO0mSjBjeqtRACzSSL7MSNZX6prGco=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Elyrkj5SaS/Kf2ydCefIOdwgZbL7Nx2HDrbDo4llwzpH6MK8n
	I4Fl7CzCXNt24ZYTpYyX5SkeJUfJXlsUDh+VxnUF5TNqBicYZhTX+jq3
X-Gm-Gg: AZFdTZftFLEYmmOK7PNz4VWIT7VztSiiLixDcopmL6CKF/SCkXZkrT7GWu6ME2I4zLl
	uGL9pSNLsRlgyTkoLDfrzdLyTue0yp84/Ev3eVW+UhwbuPPOzC2iJPKUWoGZoEVTDG0tqM6HFR1
	OLDf23LmDlWHspYIQukmzMsN/EtaAM7JLFtt097c5dhIwE5LDcqYnz2yHudktPCrJ4SrC7mTn0M
	FP6024+mpS/N9FTijfrnBsCNHVqUeAO7LCDErm01AOuWYgQWsUjQIZ+APtwFuNLKaRjCdwNcgg+
	S8J9Zz599fsbL8V75sYwxr8CmHQSztsEMDoVILCpNKowMVdBuboDeH1SyCGDvhCIBFSwTFg6tVc
	kd67vkjZ7aR7e/vZ0h/KWK7zy1jpkKd5Rj0Bmuxm0EHtMX0nmyFPNie5fZ7aoqO3bZTgNbs/xh+
	sUzpRaH0NfW5y/6/xuA+KNX5C1GNrUnWUptVg9uxxwwg3a1EkSq8mu6zHquGaWKkTE9VnKJ7sVJ
	LCaUKJiRC+POkSKA/lLPH1vxiQejjKAiFbVxcjpmABxNIx7fh5vH9z5yaFK1KSbTgcQaYwuV96V
	zgHd1QGabmvqYk+cV9HGVnBihVFgUmyE394QfoKzbRkLJYzh44XyeOryTpmAzEzcxpxIefuZa6W
	bK31aHxku9vnFhkGjuN78In4ydSHonyKZmhXrD7FK+5Q6aCoJ8yPnIZCwHPM9qGg1+46kmUdcch
	w18VqfeoANFeeWM3w5VLdAvgpCtfuDuvkIPq2u8jov5PcYg8tNrg+meb/2JSgmFmqI
X-Received: by 2002:a05:600c:3511:b0:4ba:73f:ef5 with SMTP id 5b1f17b1804b1-4bb88828304mr481591525e9.34.1795756460683;
        Thu, 26 Nov 2026 21:14:20 -0800 (PST)
Received: from sergio-82n7.homenet.telecomitalia.it ([95.236.10.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm636515015e9.15.2026.11.26.21.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:14:20 -0800 (PST)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Navon John Lukose <navonjohnlukose@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Fix fan paths for Yoga Pro 7 14IAH10
Date: Fri, 27 Nov 2026 06:14:19 +0100
Message-ID: <20261127051419.479659-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <b672573a-f0ac-4ad8-9be8-6f3a554ddd98@roeck-us.net>
References: <b672573a-f0ac-4ad8-9be8-6f3a554ddd98@roeck-us.net>
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

Hi Guenter, Navon,

Apologies for the silence over the last few months -- I had to step away
due to a family illness, and I am truly sorry Navon had to track down and
submit this fix on his own in the meantime.

Thank you both for taking care of it.

Acked-by: Sergio Melas <sergiomelas@gmail.com>

Best regards,
Sergio
