Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996083;
	b=irC7Sk14u17gLN05ZfVJVrUs8Qaz/fvFCZ6w9oo8CuvZ/ute+XH81uplJvjPqd5AroxP
	 2L1VpBFGRjOoeVptt1fZS4Atcy+AjE9cNaglWovWe/mCn8OHEYUUa+jzaEeL6M10nWIwB
	 InWQ3nBy1GVsGuHgwiglVfSoZONToHXi966R8a/nl4sTlb6Ac6ulq4eOR/YZL24dnlTYR
	 6RxNVQu4afS8/moF/uLCug6HhhmKbZaI3j5cT1ZDIvjeAVFQ6buP0F9HnC6n6IOJl0zrs
	 ck2PI4K0B9ZNvEJ6AOhHNdVRPMjNhiHpabO6lMtK7xkJKv+LCGxDkCFPyTZo78qNSNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Dz+hOXXzBRP/gLMriNGtkNpsg1THjB/csTcrFJ0tk28=;
	b=fb+a+So461NTvZ9o8pLUPLKX1Ui3YKtPluKs+364Z/7nqjjjSFzpSoicJR/ol9flJjMb
	 d//IpdN4LE3MPtXSc52P/nikX+nZIwcOq3SN8helRxnWg4xiZgqUMFDarBPxMckWIzRV7
	 3aS2ofIyPuZcPkpqxpCpy9Dw5I0rp1IICbZmfQBFxS0b51HlMfat2XGTEirV080nFdJoA
	 eGPTc5FvTP6vHHWFCGh9a+qFtJxf9YVLtXB3R6EdAK3x6/WqHGypinHzJSV7R5LWEFrVj
	 ex5l1LKAMFOiP+Lh/wS5SOS7UfS93gI7UaTgUdi4a2B1ygvvlpuF45Hnv1pGzw2RgEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pKp3pifZ;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7F5606A881
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB7F5606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pKp3pifZ
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dee593f18so586676f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794996081; x=1795600881; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dz+hOXXzBRP/gLMriNGtkNpsg1THjB/csTcrFJ0tk28=;
        b=pKp3pifZh7oPRMGIdtXhtVCIF9w7fsfK1OjN9ZPXwb6hqnHbkJ5QIO8yaqRaYGMofl
         GLVxSRH8TK4RR5BHl2jApdlJoal8KdDADynWdzAVg67RcrXeBBh65J4+2RrqB5sogJ+1
         1exnMUssiaPwgqKELu8a+21av9B9EhMuA3Vfwx6WC264T1y4rjQXUlv+ar0WmSnLHF86
         Eib9dybZnE36/WA1BukkZlVvOvA27avrYxdG6YYa/f3E7XWJwQq1nb9sSLoclVR7XSD+
         wm7rXHqyIT6BBdBVG9SNPXK6EUrWCHLMhtmFEpVn8ZhxlCS6wy+hfX+nAAHvPd3+7HDc
         Khxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996081; x=1795600881;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dz+hOXXzBRP/gLMriNGtkNpsg1THjB/csTcrFJ0tk28=;
        b=nQLK00dsvx4umkut3d9eB+eGXBOhGgXPvWysSOlllZwe69zGMqGmFtlgUbda5ePw+x
         4N/Pvr59Iyb3CgPBnfhGbz3baGmd7ojfh8Tj1KPQKHCbKS14fCfBNwi3J3dk2JAl59I9
         tpPVT8zm/kB+l7WU8yrJCXjixep4wvjZRmyJVomNXc2oBJTCLizPBrYS/1dkCY+++Q53
         v5dO/3QxxVZ1jJxBv8Taux7Ffgmg4vxNKF1wrc0wS/cflyBpiCUfguO8yu5sFDZvjoIr
         Ik6VLEg+9kquqd4Lrrfum3+3xXla/aGmV09fo7ZkB2iBRn8A1I4oV4f+KOKogLeRJ/rm
         HGlw==
X-Forwarded-Encrypted: i=1; AL+hErEaLsHXTKBz61rv9jKtHSMJo9B5Z08/jEPmhHc5z7gPVcPGe3w2dmZ5u7ViKSk3hGwRZ+PDaxehEzzQ+Mk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KLkT3t7J7TqUBKgIbqhVcu8VmFmpx4o+IdXJi8tmlCDksDwuk
	uR8zFerExachv8jIST0ZZkVYYnoFLFOJDHan1AI1nlnHnC4S5ZiaX3Bqkhp8o6Jhcu4=
X-Gm-Gg: AZFdTZe50f+ZCNQ5MFvQUG2hvN2kNjefRyf7J5jRPMMSZKfZvr9/xU+br5ETflxpn7T
	PJ77jsLry+ZoTx5idIIOPlVQKenC8xcM+ThqjIlmTo0DMO4mdhVMCrI2BvyWI3QTVFKqyMhEOQ0
	e1Zj4jyqM/dBJTl2jloykOXJLOLtT2ONqulDW+/TGbl8L2or0NtKEVKe1YWyoN99T6r5JlJLcG5
	k5UmIroKkhMExJHMEksEx1izYfE+CRXlgPJ6SCyRqRZD1lYQMYBogpnoY0v9RFxdB+sL9036pXQ
	KUb3yo0VPMl/MeXEXQxpsOpqb3nEDQ8CgHO56VyvCcb7iCo8G3UPu6C6dJv+gVNrSgp1SG2aLJ+
	g7AXi92+2Q4aEAYMH7WztkSpCmHmZ1x/BVhZasrYpr51QXv6N6oLl4Uow3BDmthm0I7hiJxFiMu
	0Zf9gyDYn+Ugj8joqZPxpgA3CwyL1DAnbuYLlak+4zYYYgMoaEhcO0nzqEdNn1tz4MtDQwIcM1X
	swHz4J6aNyKyUbq+cJ+ZRRTB0kFq/TrCZbrfxmGSTyNfNC9yed1M0JH7zy/wvMkLEc/TR02GYB5
	xwf/DPcg+OsmGJyUfFMwFwWzbV/xE9q+dQ==
X-Received: by 2002:a05:6000:40c6:b0:48d:f14a:9182 with SMTP id ffacd0b85a97d-4a6385221d2mr4182620f8f.20.1794996081159;
        Wed, 18 Nov 2026 02:01:21 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c257sm3680960f8f.13.2026.11.18.02.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:01:20 -0800 (PST)
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 4/7] dt-bindings: clock: Add Amlogic S7 PLL clock
 controller
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
Date: Wed, 18 Nov 2026 11:01:12 +0100
Message-Id: <179499607256.413320.16082664027719861712.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=429; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=PtXjyJ2j06GU7bMSY1qzWJs0ZQx1vl5iBDW33+FUIt8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/y3M8boiXW+kLOhSXHZTU27xnp5PmcweXk7N8ZknuX
 1v0M+5xRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZSGcrwz2CTn+HNd5EWG9bu
 uVr/eSPv5Aat481OXnkbIqTyq5p/+DH8Uzpp5HBPWOtsl+SVHVlxdlVPN89t+rGZe5WDQ9zFwIm
 ijAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Fri, 06 Nov 2026 09:30:27 +0100, Carlo Caione <ccaione@baylibre.com> wrote:
> The S7 PLL controller supplies clock sources for the peripheral clock
> tree and receives its reference clocks through firmware-controlled
> oscillator gates.
> 
> Add the binding and clock identifiers needed to describe this
> controller and its connections.
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

