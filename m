Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281798;
	b=SFRf9cDCEu7EDU/dELOlFW+vZ71usnNyYSYd2V+CTVmG+HkaVhe/jMT0j/v6aN10XgTH
	 8wqJy0nQYWAdA5nQfK7qaLRJCayvBqa03bPmTFtXbPGURC8yah1BNgvCGm5bJrvptl1QD
	 z79AuASdN9HDh9H/1Uk7ihJ+m7tYrvDpd7N9OpfpKWne03b1BPo0IvsO6QXIe54mLOOyT
	 OtId+LJAEbkCUIlDGVAmJw1dRh0kTBx4XhIPlMBv/AJV1rDW6+JkaWhR7l5ai/pha0Bew
	 ApESiL4ZrG+n98P1PSMKY9af7p5BF7IFYkQrlsDzVaxkQ481ZKwtqc4e8aAkQuXW8aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CrE8YZPGbKenKXl5BgmqDcyGKii69/sK0NCMMLNz2nY=;
	b=oLHllpIDUZREsf+zmsqd3zNQIILEBps7OqUCmvawEkq6BJX+pnqA8LIjkWqeX0CcBy4D
	 T9Jo6yQAgdQ+n6cwUHryYOGjchP++tVYR36zoL0A3m2valeNFF6/gu8R8sMLUN1ikfneS
	 gfIxNIF9Js8qFnLe7ZlWrqgJ1Xz8nXV4HF/yopte1+ZyAUoKCvVfBSE1sCN20+gitoww1
	 yUUuThn8W1Qe+r0qj9FsHK9OzTFQ9si8dWERsSBzIwoXqRTp7ju3TnJxB7ieXrUf8io9Y
	 Bktzq4IKlELegQKiB2SJjq7H7rtnTWsduQESTB1+d3HQxyO1QiKGaNUClRFp/uxra8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRO3qt6j;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1713606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1713606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRO3qt6j
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-380b40312e2so4145545eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795281797; x=1795886597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrE8YZPGbKenKXl5BgmqDcyGKii69/sK0NCMMLNz2nY=;
        b=lRO3qt6jwuQ3jetshv02wRrSxpRYrXbQXzoajLn1J3Yq4k7u8wVbh9XMq1yJERTZ1l
         qiCgHYN+rxXKDOy1LND+/FqW4GmTY38yOVM5JL8YETrPyQQMX5wG3Ul/MSRJ+eDEdOhw
         mH800/ng44G2LwJlv36HaBwMHsHe6lC0axjitMuLP9OHU3NHlOMkrg4lsG8vq1RfCaud
         ZtMI1aJf0mWvPmS6D+S1FX4VZI3tHzWY4JB8U87wGleiLvZkrbb5ukzrEvj9WUKaA5Ba
         +BIb3OfAn99n65WsQbbn4CcVIIhF8IWQzGPrUUykZwRfFn1oKNBzyd1rt16hBSfHAa4/
         uSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281797; x=1795886597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrE8YZPGbKenKXl5BgmqDcyGKii69/sK0NCMMLNz2nY=;
        b=QLRnZnGtSoUho7CA/YUcTC17UzXju7gfdKK3+J4Ysriv+/cEG/lLTciXErP/21UmAZ
         nyVCVNtUeBQl1HeyH3L2xZjcSr/HjkYArmxJxR7yKelqBvwXSaOxvf6/pzoaURWNJ0hD
         FhMcEPUHubtaBUd/f6MBMQLXOlJDxiZlrmyr6YgfpZT+cgVNqfpu2OJ8uGsxE4YIf5TC
         8ciLoIo+16cDSCyLd+9yQpfLrkXOazvmYIYnd/3hwZZ8SfC9/b2Vnfa+zRRY15o0apI8
         gpHm8Q/F7hNpFdJrmKT4gDoBwUqqDjA0RF44b97JNn5WHgo58kE7+14mYYF7zF5siGRy
         6xbw==
X-Forwarded-Encrypted: i=1; AL+hErHSFS5e36KsrzAFRgudB/tSKXBTYYS2AET/BEfyTULYfLzcLBlEmEXfbSmIsCDmp29LH/Mx34ub+1/+clk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wBEbuAkmbR/IlKpST+6oJLbkQoZmjIYWSipRj6W9CvFciHube
	2+0ggLEbuw3eVJvrqAVR5HglfD/5H+F3qX6J7uVUu2A691T9o5Io/jg0
X-Gm-Gg: AZFdTZfQt2hTLlF4dcCI655WI/k8L1YyZPVH2eNYfjas3iHDYMQvm4HCExLP7L07V41
	63rYlAnt5jIny/kWk092RRMdjAzl4FAhqZeNxf5LX90y1kyCmHAnL/fzbK+SnVGQYKaM5rlXFbP
	9mRbkUQnS/CrI6lS1rYCl2Ptq4AF5mOaNWMbjodvoeaRWsPOjmqi5at5edCulQBBpHy0YuQ7I94
	F75KeITd5iCbctBtYU8z3Y/uZQv2nKFURcWzQPUCWw1y/Gu7+IJwTRNT6bidY4a4i/QjsYczrgi
	bwX4wvBaoatsjhcf2DG5sNfoUFkcKBUDN7P1PWImoE435i/Olh1zinoVHTKY9zORg8U0cf1sCqW
	AXg4okN+R4KmwmBjlLv6iDv+nOP7sCtt9sjYobtd7OrTLI4nmDLldGuvUzZzgT9Ul3W+IetloY0
	QL0A+qQCUhcFvSHsLSBVEEDRur0htxnZsthwnc4mmg4HIMZpXOtcLsLjtRTXlPugBnJIIjYBLnq
	1xPAjrtfu3YuzM1yITCpzlJQNId0s67rs/1dYtjbQjkAq/3L6fL1Ieqrj+cCvXtI6zPdK/teqkW
	pDZP6pur1283H5SnTEEfcMCwLZABb8U10+YJ
X-Received: by 2002:a05:7301:e0cd:b0:375:dbeb:b363 with SMTP id 5a478bee46e88-38570f221dcmr6879077eec.28.1795281796821;
        Sat, 21 Nov 2026 09:23:16 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:4c23:efbc:89e:50d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm22413703eec.26.2026.11.21.09.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:23:16 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 08/11] arm64: dts: qcom: kaanapali: Add the second DSI controller and PHY
Date: Sun, 22 Nov 2026 02:23:13 +0900
Message-ID: <20261121172313.812-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261120-molokai-soc-v3-8-403d763685d9@yahoo.com>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com> <20261120-molokai-soc-v3-8-403d763685d9@yahoo.com>
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

On Fri, Nov 20, 2026 at 09:23:10PM +0530, Venkat Yadlapati wrote:
> Kaanapali has two DSI controllers. Describe DSI1 and its PHY next to
> DSI0, connect it to the INTF2 output of the display processor and feed
> the PHY's byte and pixel clocks to the display clock controller.

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali), whose dual-DSI
panel uses both links, with a board DT that is not upstream yet. Both
DSI hosts bind, and the panel works after boot, after a display
blank/unblank and after s2idle.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Y700 Gen 5 (TB323FU)
