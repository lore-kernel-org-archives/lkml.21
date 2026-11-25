Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565319;
	b=ABOFFKVBMHxkKHmMjuaRm6Exts54CnPaGU7LA6YKh3R5pDfPhVih2B7q6LeUvxhUjBHW
	 4L2ocmqMe9lsb42yhAFRLtfk+kZWYDuojSsijF12+zjqKObrpX3u07fy116/Tv0akZww8
	 fLAR+dFwxTFYZwJvEuR3K3nzdBLq4sIv+wjRdU69mDHgsxV+sMEfKcmTX9cutf7rMMASh
	 mhN6RLj0M1tuOJZlckF3NRzqw9xQP+/2HkoSsu6kO5TT0a0Gn4CR9u6LRo+dL4PcV8kGo
	 YFwfbkhcF6uCMl6CgVaP1/+dGSjmZunt4pxDzuSxFvfSzA6zPL1P9mv+jj+uysrin/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZwSPaIIuX4Cl0pDLP0thkg2GYNUaqB0p9k+cHwih3eY=;
	b=Im1JW//tAXnKNzF7wVg8DCy884UWKcnvaG3XCv4k5IsT29ztA5XNm2wRLXeogjjJj/5a
	 Xf8LPMNGzSYCRfKd9Umh3rBp9sK5SlVywhAgu22ScKVqNxx8nNs/RS3X5uf6DziLJ4HW+
	 DZunoV7tKuTsk6skEZYf9x8OIOXNqytSqgQUqLBmWIpNmUNKwkos82aQpPPk87sDg0Ddd
	 I05et6lsyfWJ85qwl3dm5ANC0h/B+rheIAWOQRHu/UROln/12hQKhP5dVDdMxY2GRtTcr
	 vHERpmzhrd51B7OGvmAVzfk7y7uRM7FLjSW8tbLiqu/J3r8KSUjjN24JMm2p7lGPJCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xmwBrKI4;
	arc=none smtp.remote-ip=74.125.225.73
Received: from mail-wr2-f9.google.com (mail-wr2-f9.google.com [74.125.225.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47928606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47928606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xmwBrKI4
Received: by mail-wr2-f9.google.com with SMTP id ffacd0b85a97d-48fbf6c2d2eso173925f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795565317; x=1796170117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZwSPaIIuX4Cl0pDLP0thkg2GYNUaqB0p9k+cHwih3eY=;
        b=xmwBrKI4y9gSQCfHQWXQHK5UdgmVg8LEO4WAHLoGZRtYOOSDMd3Z1JW4B4MxIEcXku
         u3OhXWrN58JQqZbS6bFj7+qNeDtaKt1qT9/B5+sRvJdKmplQMVTbGWE5OhomWq1AQhsF
         4TtWxeMdglrGfTnqb2iij/FQiwVetXlyaWEBH2xhPohX+Ess0zCxakgjL0AP7kRdwh4p
         /cAT2AQqktaM/tRtRkEUJTkrI94wUnDHOiXxmCf8ILQCV2iLu5vm63SxOZ307JoR5zLk
         OfHoahKl11B53xVp4+NJJzJIOkpUWc1pfDBXXuYSdtOnNUDum20wPdSTpLue9/1rTgA8
         EiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565317; x=1796170117;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZwSPaIIuX4Cl0pDLP0thkg2GYNUaqB0p9k+cHwih3eY=;
        b=0B9IO7mFXMsKKcyw5s9KAvStDBZaVkOmN/Ulqb2HiHDK1Bs0Z2sxYpAPt5xzvIMoXE
         /fqCOVG2XO+9QjlGjlTXrVZrbK5PwpT35iPnNYdfFwED/OC+sTFi/0BssuGM8CRszXSa
         x8UMWo49M/kwnrcvN7+8G1oqR8sqKrBfRV9PXiEh0haVDeEkBwbw+FU2fpy4i5bThGpi
         0QSvIi1f91mfRdSi+bsMMjBJBOhWi/B9Sc5NRPMV+G12800g061hJ6cJuBtkGm+L7rg9
         FVq/CghleFHy54OUIVIB6bXfd3PY1DyIATVCFKJRXyN9ODyg1ETX9jMsLETl+mk3SHHo
         S8lA==
X-Forwarded-Encrypted: i=1; AL+hErH5+fseoBhgizm7BnNyHRFgQLsOvg6plfFBbkm52/5hYSOgE9iIadjUVuk6V+y325WTsJ8mCTHL4n7TgSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ViSABpEhltB3U5C72lstpZM1GjRsnwEu/wDQitasM1K8VVH2Y
	5MBAqyc5sGTtN86+F2pEhrkMHqyvHcGzgxrbRSOu3y3GFQQowIR6kJ1l
X-Gm-Gg: AZFdTZcEjja1kn+vw4J8r5crDqYfp8G0abRYLm2ZdFgX7p314IrM3azFWQWPHvSkFCv
	Ux3SEj9vus1ins5pHuAyRW+eNkya4IUn2fi4jLPQnHltn/wmpG7ykOAUm8JutzwoHiCLJiSLFbt
	/trKQL4vJLuUiEyeAmy4veAYWAEEdNlY9I9BxZDAGSgjDPKXgFbSJbHtkWC0JWgqnOcyMpA7Nsn
	C9x7bCONGSNc21lVEzaf1oW/zsCWD5L6/yMQMHW1ZavzmtJAxEnzlGl8d+grZvjXtx49JRDGkJL
	QfPEtrLIi0Dt/dG+ZJlb/8YzUBr65iW8juU/NkeLKHMOTp2oBXbAnjo5vnbNYscvNiKVqupECbE
	NfBrwKYo/nn4/mzC0gSHJjV7+MOYRf5Zo+LnweUhFRR2auiVatb0eYV37uxuQ2V7vRh/1hXeShy
	+Vi81DYIK3NS+gSY+HnxP+fDI/TzmEeuI8rYOKPEIXeWjjaFo9XkVS07bDvPuhWZCv3F9ARg/74
	3fvXqagvroC6qwmMCbQt8rj/WtIeUoG9YxFrXzf2n3LHuP5NzfrwapGOT1H96uMLYxoPoNK5Q/O
	XrDsX2uM5dzz3PE27g+6J4GAPUn8nZnSrK/S
X-Received: by 2002:a05:600c:b8a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4bb88818156mr326432035e9.16.1795565317475;
        Tue, 24 Nov 2026 16:08:37 -0800 (PST)
Received: from [192.168.1.35] ([39.47.150.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm530818065e9.3.2026.11.24.16.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:08:37 -0800 (PST)
Message-ID: <543edf51-d9d0-4f18-a977-e557309914f5@gmail.com>
Date: Wed, 25 Nov 2026 05:08:33 +0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: Re: [PATCH] iio: imu: adis_buffer: fix buffer ordering for IIO core
 demultiplexing
To: shehryar.amd@gmail.com
Cc: Antoniu.Miclaus@analog.com, Dragos.Bogdan@analog.com,
 Michael.Hennerich@analog.com, Nuno.Sa@analog.com, Robert.Budai@analog.com,
 andy@kernel.org, dlechner@baylibre.com, jic23@kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux@analog.com,
 radu.sabau@analog.com
References: <20261124213118.63979-1-shehryar.amd@gmail.com>
Content-Language: en-US
In-Reply-To: <20261124213118.63979-1-shehryar.amd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

sorry, this missed adding export symbol for find_channel_from_si()
and fixes tag, will send in v2 shortly :)
