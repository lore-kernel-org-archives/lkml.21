Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795411175;
	b=Ty17opDb9BXtGpIXLz26tXQIm1Dl5QBE/+jNuKeDH6phlnONS6SFSG/hR+5FQbaCp0B0
	 a5uNDkXOtie2lcYGqDUyxUJnPq8YoMF6KM+hr46TnI5aTH8W0PvMGH70Em62FrlGRG1Wx
	 31l8II8Tm2rXzDpLIyXK6qPX0axclnkGSop3kIPelafTBNpUkNb8fJksfBolm3VQ/oshm
	 LziGgF+c2UKfbOvyt7hweB9FsHXB7RwJnnHxTq++h53uEGIcGTnSvev2Dp9lt+gRysXdv
	 4RbmE6FnMpCtNd8M4d+R/1j3xrxH6rTn0PcJeckrXCv7VMJY/P9FstZyM66uRPINzLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FUqLDQXnSJ5sC0anYruumGCX75FgOtK3GjAUXxEI5pY=;
	b=W8/+CY9TMnEyDcTmkPxdVTI6awP+ndC24CVgHA//RExVE6mNgJuOVLxoT3L5ji2PfCF7
	 362Vb8FhCvE2QnN8lf0iFKl32Qpu66lIxwqwL05YsTMYAclF1AQIQo3F6kiVq2RcnLnps
	 bx3bogocCGV0NOPrl9P8CRkCHJgkXMd+sRWiXCqNFSbPI18yLCJT4DUn0Hh9L0Ns9m/wG
	 zRj57D3Q2KlVUxY/3z7zv30y5h4XYMzBoC+gO8xnAQQ9R0plinK3fN1ksDgfBPgbguuy5
	 +wTTNrZv3LI94iaeo6dmTScZ7s6q5np3zYJ5r7gl8PHhRJ9mlyx+OxG00x2dxUCV2oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="Iq2fGG/d";
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57184606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57184606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Iq2fGG/d
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-949657a20d7so318731585a.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795411174; x=1796015974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FUqLDQXnSJ5sC0anYruumGCX75FgOtK3GjAUXxEI5pY=;
        b=Iq2fGG/dbOi6KnKOohKbryY/f+ENYLf64+rSOoj7mHE7vFCYd9QA6rVl+MIEJ9Uhye
         1SCXQkTqMQVAYXgefuj6vlBLpVC71oobIEq4+F4qprcaeye+A4g8CK0frPKqrMQq8wUk
         7owk7CRm3bq/R2SncGKu1mOSQj2JyIf8k5dQ98kKbGq1ST0/FR5bYYwjcKY81Khpbhef
         VEYjEQ9cgmcvnWxI7bDbaQ3zAbo7zBmIo+oYyxdGcVDaRrVdLdyJU971B8H5yue40WFr
         i9YPo+kh7uQS5Y23sK0qUOtFDATZg7ICZdiFtSblgW4qlA2RM2mc/4ssIhrAs2bDu8Rh
         jcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411174; x=1796015974;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUqLDQXnSJ5sC0anYruumGCX75FgOtK3GjAUXxEI5pY=;
        b=KOkv3IwS4+ap/h87M2+0bh00YqTT3r1/ocm6Gm8yx2MG50CQWerTo17mm5jcMxgJ4b
         +8d1+QetaliuMQTNh8/aRvMAL+RKOR/fAdyq6ZdD2OsfFHNf3Y8HCLp4eE6xZMiGgLi+
         +pz4OWkFu3SxD/ldowAm/6Jeede6AMOtLd6i9vIbrrWO/OWr4jXRO7kT48lC39+f0sRX
         Y99glhI2GLUsE10Fd9ao3dBXHbz8zanFwUUZKfQW75dodgklIerH4KqskPpgrTFRsUHp
         PbxZklH1ZOPw73/Uho1fbjgGabIEIVZrOgfXgB3AYr5t8NSDVY/j9GojLqwO9uJapPDh
         0Pfg==
X-Forwarded-Encrypted: i=1; AL+hErHvDF1ArQYrBKo7PhYpIHXE3XkIPvOcb2b2+xoEz3+Jre6l/pLjIKXNwXxcgRR5Pij5hFLFu0kv4y7id0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9588f5usk+zA00Jtub+BtpmbdDqix17kar5ydfAXrUULj9JVmF
	xQfca4FpfAfWBx2TPSFrxhaJmKedssCHGu4ZzLRLYF4+6uu7/h3OqDDyPh5Eq6+X1KPyG1EVmoR
	gTFYd
X-Gm-Gg: AZFdTZeYA1aQR5H++ZRpFFGj5AMB6prtjluNEB73VfpfIpuT5o0JSFf34uP2a5xHwVF
	oD6UdaLQ9PDLJ79bbYePauU3QVbk0GcBi0lH9kzj44k9SbYtW0Pm9GTZ2SccT23mZKQZlXp1m4m
	8EPt7BBXJniRAWeWclBkRlcW/5dGfOcUIJSsLCqi7ebwx62+LJTiZTbZQXQBh12ehmY/iU0DJG/
	bowAGwkq50zgClH7O9SmZXZ9QUM/YreLsMFgfoLY3kAm0OKPyinJ7OsiZ2bYvRp+aoUbnNu1670
	5U7G5OW0ImKOO4VFwhUpzFgOPIOQ0lUCjVv1OSOAfPyNA9TzdtTOgh/fcX6hgDI9dMqaSLhqobM
	/6FdecXsPfWxeOa+dQfsfnds6vrz6HJhvTuggSfRirWRusstjmHk9je/hgtF+up21TCNou1AUKM
	SLjYsJEi3r6LbA3d2q5R/E5GaVeViqUOqvr07YWtkgOs9pIhVBzlOF2uTzSDnS0UhAiKO0WLPDn
	QzJw4vt4HMZz1ouxWR3SBoBcP2SxSukdjsJlOA6DsywpXoF0r5AyCbfYEpCGIrc6WFrtc8w+vjC
	T5u2W04/NXxQfFQTSILKugNWvABmUQ==
X-Received: by 2002:a05:7301:4710:b0:378:314:4042 with SMTP id 5a478bee46e88-385702587c5mr10487392eec.14.1795410782709;
        Sun, 22 Nov 2026 21:13:02 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm28221624eec.13.2026.11.22.21.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:13:01 -0800 (PST)
Date: Mon, 23 Nov 2026 10:42:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: cpufreq: apple,cluster-cpufreq: Add
 M3 family compatibles
Message-ID: <awPLW-zURwW1dqZX@vireshk-B250M-D3H>
References: <20261122-m3-cpufreq-opp-v2-0-3c19963f55ee@gmail.com>
 <20261122-m3-cpufreq-opp-v2-1-3c19963f55ee@gmail.com>
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
In-Reply-To: <20261122-m3-cpufreq-opp-v2-1-3c19963f55ee@gmail.com>

On 22-11-26, 00:18, Michael Reeves via B4 Relay wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
> 
> Add compatible strings for the Apple M3 family cluster cpufreq
> controllers:
> 
> - apple,t8122-cluster-cpufreq (M3)
> - apple,t6030-cluster-cpufreq (M3 Pro)
> - apple,t6031-cluster-cpufreq (M3 Max / M3 Ultra)
> 
> All three are compatible with the M2 (T8112) cluster cpufreq controller
> and fall back to "apple,t8112-cluster-cpufreq".
> 
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml          | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> index b51913a81791..516216cb6ad6 100644
> --- a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> @@ -36,7 +36,11 @@ properties:
>            - const: apple,s5l8960x-cluster-cpufreq
>        - const: apple,s5l8960x-cluster-cpufreq
>        - items:
> -          - const: apple,t6020-cluster-cpufreq
> +          - enum:
> +              - apple,t6020-cluster-cpufreq
> +              - apple,t6030-cluster-cpufreq
> +              - apple,t6031-cluster-cpufreq
> +              - apple,t8122-cluster-cpufreq
>            - const: apple,t8112-cluster-cpufreq
>  
>    reg:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
