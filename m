Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990811;
	b=SYPmP4NQ3d5FMh//6dDuFEhNmRUPjgPH5orWSmSvNNx53okl83BoheZrkKwthw+udrAl
	 tirURiG1UZjEeDLfCVPv1oXf4YLAHL2qLT7ppV9EQReG32PFLMjoGPxW9W+n/w+RZJNSK
	 xJs1ikBebkQmrelOyGdXsFRWaa1/1dGlWZckeqUPWvrYH0i2mg/O8I2chKl2ebj++5dg0
	 EUXlftYbrOO3UC94gGlQShwfVc6lpiQ7/M5QUA9ZQsQByH9Gd/cnRbC8wCe/eDh/Fq7Uf
	 cw5zb3uR6jvIR2t9ZKW7/YXqwevZ6qNuihzCozc8L0xC4+w0rupa/i9dDbUYS5JIx1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WZb+73Z+iGgox3eYm8t3NOu03PW/JBfAauUd0nob7V8=;
	b=HAMawRZp1n/xqsJwrfFVWRBQY67JcErfy+SIj+6yzibAOjHzoRjyqYIeIsQdjtOaLxs1
	 ki3Oiy+FDSZVphZY45mQ9yXDj/e2A4JFkhW5fS6QtO7AaoJSlXH7RpIn63rNtt6EOlrch
	 EZS8X4x59OQqG7lXcK52G5JWMupxsqaTaJRQXPldTLR8ZOgckG/KZyLiGiIvE1J2lRnSA
	 qV0cZFGHEVx9+L7+fDj5MLawFmO+668ZOhbiAAje0Dnr94bBMz7nMoeQMEvnIG3q7oUuG
	 ld7ttWKMN/E4DZlpGegSwin0GuFS78dvt8wz1w9BJik9z2SnRBpSUoVKRgLSb338hmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bQO4D9qO;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50609606A88C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50609606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bQO4D9qO
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so5782705e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794990810; x=1795595610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZb+73Z+iGgox3eYm8t3NOu03PW/JBfAauUd0nob7V8=;
        b=bQO4D9qOhqdRtujHIY8YK9X32hDfdF7vpHDzmnZKDOgSmy8t805+pS6gwQLlGGCG0C
         yeUEhGJ86k5Y6t73jvrOO5DyoL/Zy+h1GILrdZ5wm9i2fyB4ZERfAPH92yOw8yN95nSh
         9pb3kr9sLGBGFWRo4LiOivQC27hkdzYho/pN6exN695aVHhjS/Lif8uRyFUOgQr5gw77
         SVEBLNvOodqfX4aGDhAisUj3l8PNkXU3zVVcTQz0z0VG8Kt2LvGKv66vUPLosGQMXgWm
         QxfyfxsN/MGL7u+o5vIz0A0W0L+PjUrKVdq/wQJ6E3H+hUMGg3ysgTEXBeg2o+DLhRrf
         yXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794990810; x=1795595610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WZb+73Z+iGgox3eYm8t3NOu03PW/JBfAauUd0nob7V8=;
        b=tYMSvHGDNhn1+I+7MTmTOjZqXzr4ZPFTbkYy2p7uCDNMawh7tNuTmZ7bZFceahVwpv
         SzT/xkJ5Um36ndYKonZGx0iSPG5QYRT+uix3Ffh5D0FOjQxUoTSgjxZqs6OuXEDulSZ2
         F+l2pNVb8RjDT8CxggE4j8cqwfDLRrJTa6COUApdoRsG6gfKZ2kAWAg+41QRFQSfhL4M
         ns4vI//3rE89jhcP2wS+Tyde62nd1+qzAOLsNqK0N2588s7y9dJX+WXfiTAOhQTTzUnW
         3/GB9PjFYyHzzAWCCLqd4Lb1fDQYfxzcfTe4FJbvY0/eiBDcod18VYoPvNF2LyEKsYCK
         N3SQ==
X-Forwarded-Encrypted: i=1; AL+hErE1HCAlaHm82PCy4ZONnW898sHIU/htIUSqeFDyr5foBfuh0bT2sl6tgvjLZcElhnko3ki8UvOOwCbPdYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+tL/qsSApvpG2SacFzNRih8zJEfJG1n54D+Mmv+ETOZ+TWEkV
	6u/Y7oJrqB/JQIlNSJljufcIIwfoUNl8cbxrvGb6RQY1DQBOqNQULqaQqIrIkMPX
X-Gm-Gg: AYBFou37MnKAMU9hRW9d7Pq1xYFeexfICqhpFJrg1wA26DcRnv6bhxNW9tpZwbKu+a0
	L7ivf8Q9KQ/ypg1+qBztWZVtz1SeviRvRyWHfoOMRwMsmz4sPDA+6MCH2KdHBas2o7O386RLP+b
	usX72c72QUbtWURNVxTc8i3uMBX3iOA1zdzarrDYObF8JGS30Fy9pJGded9iK3bACXXEDFc6C/k
	J/CyogtRCRu09AzjCHtKUCtysPOrYgr4l4bhaYytNmF3eI79Wc8iJXkJAVs/Ib4DciITmXUjL9D
	2V9i9cy9cIOA/P1gzYbfjf8z05V5Q5MorpULlQZSJJJ5E3a3jriT93GMfD0bYoJNiyLGvvkTTNU
	Q7045ZuyRrA9kGXGD68a62s2RLBpuEQoxsL8eLD1LBgWulAkdK5w2hMqzsVpl71sXuVtyVECadm
	YjuTtYPTnkw9lT28/d40qsbdvmDDb8InEN4m4in8oZ73A0vjTrHTStsTLuV1Kteg9EaTJxNeYup
	bG6fYzA8UKZd6nOc77xTJGmVJpBMKV2Pn/YDab0qeumsY8mcuwpMNFwgY8R+lEEqOEJW7lFck9h
	NgU9i/QRlID+MLR17tcF26M0w7TfCDXLM0k=
X-Received: by 2002:a05:600c:6290:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb7d6cd48cmr34574185e9.1.1794990809715;
        Wed, 18 Nov 2026 00:33:29 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm127318605e9.14.2026.11.18.00.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:33:29 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v12 2/3] wifi: rtw88: support channel switch in AP mode
Date: Wed, 18 Nov 2026 09:33:28 +0100
Message-ID: <20261118083328.1984956-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <9BC4FC13-5723-4711-9798-11E3C285C7F1@linux.dev>
References: 
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

Hi Luka,

> I think the presence check is better fixed in
> rtw_core_check_sta_active(). Its callback only reads interface state, so
> could it use an atomic interface iterator without allocating entries?

Right, the callback does not sleep, so rtw_iterate_vifs_atomic() works
there. The check is older than this series: since commit 96fbb84de4ff
("wifi: rtw88: handle station mode concurrent scan with AP mode") a
failed allocation also makes rtw_clear_op_chan() drop the operating
channel of an associated station, on BSS_CHANGED_BSSID and in
rtw_ops_stop_ap().

Ping-Ke, Luka: would you take that as a separate fix for rtw-next, or as
a patch before this one in v13?

Mehmet
