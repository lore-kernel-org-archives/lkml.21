Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866791;
	b=EV0okuPJHLAHG+2/1dZjUhhQVZ9rqHJLzcWiUTuZ6mV6ZtCbQlXkC5QDvcEmcINAPv/I
	 MZerwveUZF7oiFLKUwZqmRmcvBNQAM2S7MvxVo0KKoPrwnTqnuw4jq8KmqiCEF/FSFVY4
	 Dx1bGc2I5lmD7ypcUFIt+5bPxNr7eI11QStstmOdaZe4tADnRivsraxwuc5SVkw+z4Pcc
	 bd0plw4KVmGzKcPNv8HuABxNtJPT40PjfdMVZ6UlMTDdyebEzdy70Uhebewn2Hi3n3l47
	 D5EzhAEGwvXrHkVwW8LCPFknvURSizeH1OatOFEOjevyWp+Br5fsSzNKznQ23H0yEJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2aoRkbwvpEvdp5sy1ThoThAKb1QQYA2IMTxLgEF5n0s=;
	b=UWvsb5ymLeglFQoP9YkA7rRQJZ74T+D++5ZOFdKjPu3KSjj3+cpwI60YiGT/9e+pBqlQ
	 bs2NOfV3pNzY/6Wdf11ClmwBn86csMxQ0RbJpbOEm96STSLQ+vN3KPSk9oumvyt0Dq1Mm
	 5jD305/kD6yHOhw4hrH1lRApCr9i6iU3xHHarV1fRUgjrWDIBDJ+qgE07RwBkGziOYoOS
	 vtGMP1Jm2LyHFnTaceXbN1uZBwDyl70f0CDTR3m4bDjESgEnlHCpyxbp2IEkBhyxy3h5M
	 7zFVtZ0aHGoujY6w2vOE/XzorJyeT5boNWuDX2kCMVGiwoYQfJ0dmMozHNmhqPrE8nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=tRqyCcRF;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934C3606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 934C3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=tRqyCcRF
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c516a1623d0so1044357166b.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795866790; x=1796471590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2aoRkbwvpEvdp5sy1ThoThAKb1QQYA2IMTxLgEF5n0s=;
        b=tRqyCcRFf7CBNUBCPqXSGGm36NowlRg9q/fOGxYfec5E7TM1rCWj8Q6T8fP1ldsgPB
         2/YdjkBYzgck5fBgjBgxY+FYji/fCrb2eKNzexKtPM+a+nzEsFzTDwgXlgaAR5GCLqoq
         HSqLYfqNoECUnoHbvOjeGAAkDtWcUthyYY8XKONor1cdst/dM2KGAj6812ChqvJjxbWC
         rlWUoknR/9adVQAJ59k21qltG45wIDYyZNngynZam8TcQ0+IVPzeQKybs3ZfJLHZBCcu
         Nm2b+2uHYpozLxaj3l9OvIhHmZf7QF+Z/6hMqGQQWRbehx7uNzhN3SxCTUWX0BPQCZ1b
         3Kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866790; x=1796471590;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2aoRkbwvpEvdp5sy1ThoThAKb1QQYA2IMTxLgEF5n0s=;
        b=P/oOgV91+eP2Q0XjXSoO/sYFbE8N/+Kt3IXRzqCJktb6RFQ5pdjHSH6aebXshf3d2j
         37T58gCAtY7JmM5QiNG7AqJ6KxGDbMMT2mQrGbbPyu/3DF7jnWfN/D4AcuZlUbdQ5zb+
         cDKLeVqcvywEpmLMWfZ74lChPAgfwrhIIfvji7rGuu5l5xxxdL70ilDOg+Bb1qbjzq8i
         ZwMXtu/kn/QVuhBm5bEK3lDcAQehk4MXBPRQmava8U2Zi776BhDA0OgTrHlOXxKVACPR
         TglPRrdS0naJya2khqbI6bPnbzv5Wtyncv/Swmhf5xrePC1uGqhVWumDhznWTwuZf00h
         gxgA==
X-Forwarded-Encrypted: i=1; AL+hErE2N559PE1OgKTSJ5XU4Z9j0L/CDEziN83WTup+G/8XzwSHwsVfzUp+9Ntpp8GLZUqUwUsdopTGrU9Ykdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lesEYkW8vv2oBa/z/4RiD6KC9S3yQ6/KlFtXOKIMHfFXtVdMM
	JwOEql+vZoeK6MjM74AP3bV4Ujp84yfsjSX2i7zDNjl5r2FuRwECiOM+xkUcnP4z5w==
X-Gm-Gg: AZFdTZdIkDJP0Wwe7Vk0+HQFUiCRBf/lpf62nNL+zuoRJtUj5F3WkDyBnrlzwzaJte7
	8vFnEHCwLaBMc1yQtOlFQv5x05aVpaC944IAW7fKbxo0mHvO+93V4Ou2jgFc6IiNykoE4iKtmj7
	iKKCGLHPciLq/rg3cqlZmls6nIlUosoLODH7fXuPP2FiPeNkChTuNsd6dTgcDOI2TJA2siV4dvf
	7jwm1tcn8GA+eaGeCtClNCiNRDu1b3vJvyXyPfnCPV7LD8MGAsBqRJ9HLo5QsY/SD7+mTySnsPU
	QX+acaqLFY2/f6h7jwIEyY0Qi6kYvp1HUCvfDT9kgQAycSPWvBInWVgJuNihu8X96Hn1k8LT1aS
	BFJtgQKTNBx+s1XhhxtezE0fwLsKPcyMNhH7jrhHvH6gJf2akJlvZ2aaTLjuhSghL5XxgJDwj4u
	y8DTUmGKu6EqzCgqFjPUVtVLm2Y29Jx4esEu8jPMy5r0gXvg11sdCCjUCBiiZInwbfOAwlBB2CC
	yy08Bh/0k47uzlwVO+UxnvVZcsHBTLtBueih0NmAODAIBToOdKsAH7JnXLAyEogF7y6E5DxNaFv
	qnnltliIZ4XTHIi4Ca2ERqNZ91cssvsDYeaixp9qDuywbYGbTFwiVQR7e96tkxPtu3y5jm5WfiS
	1jIGaLYfJwUyDZT478TPJZ+v8iIlKRHsJOsX7uY8t27dP8f7vMSD3/ZcQkZ0nmY0baCV3Zvrz5U
	2z1sFxnsb/IuTUg5WlTsa76Fa9S1qd84j+FZUOZerhRIl5pJR/EVC4RmIoZk8AKhlOC6IcrG1wV
	ge6qfJGBGMoqD6Q5C0iDPPJZdMg+hqj9hq5zRIRH9dyrOu7W8Kask/8Ddz9Mg+TKSCALsqZir3E
	tP/MAHYf8fBiCXF9zDWxszqb8PxikVmdtYwWxGbatwEdh1GF0F8Rc/JV1S8DEQ3zVmqjw/85C2k
	wWvsXNchLTpJUbChLsNPW
X-Received: by 2002:a17:907:6ea8:b0:c4d:4d5b:849b with SMTP id a640c23a62f3a-c513a8069bcmr2557800266b.19.1795866789862;
        Sat, 28 Nov 2026 03:53:09 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470120008502fb937d9e134d.dip0.t-ipconnect.de. [2003:f2:4701:2000:8502:fb93:7d9e:134d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae67bd3sm959587366b.27.2026.11.28.03.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:53:09 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: karthikeyan.periyasamy@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rameshkumar.sundaram@oss.qualcomm.com,
	baochen.qiang@oss.qualcomm.com,
	quic_cjhuang@quicinc.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	quic_bperumal@quicinc.com,
	kvalo@kernel.org,
	quic_pradeepc@quicinc.com
Subject: Re: [PATCH ath-next] wifi: ath12k: drop decapped frames with a source other than the station
Date: Sat, 28 Nov 2026 12:53:11 +0100
Message-ID: <20261128115312.428133-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e019d2d7-de8d-44aa-8fdb-e6770938c409@oss.qualcomm.com>
References: <20261122210809.2087836-1-julius@bairaktaris.de> <e019d2d7-de8d-44aa-8fdb-e6770938c409@oss.qualcomm.com>
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

On 11/25/2026 2:26 PM, Karthikeyan Periyasamy wrote:
> Can you explain the test scenario ?

There is none: I have no ath12k hardware to test with.
Found by an LLM review (Claude) of the code, comparing the decap path
with ieee80211_amsdu_to_8023s(), which drops such a subframe.

> How the user trigger this issue ?

A station associated to an ath12k AP with Ethernet decap, without
4-address mode, sends a 3-address A-MSDU whose subframe header carries
another host's MAC address as source. If the hardware writes that
address into the decapped header, ath12k_dp_rx_h_undecap() sets
RX_FLAG_8023, ieee80211_rx_8023() delivers the frame under it, and the
bridge learns the other host on the Wi-Fi port (br_handle_frame_finish()),
so traffic for that host goes to the station.

Julius
