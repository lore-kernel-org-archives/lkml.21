Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201086;
	b=X++UOYtkfjHEVM+80gzK61+cjM2ADQ7yXKQmpWFVCyixbDDUnGYq6AgC9B1lWyn8DzVl
	 XrjXn6f7Sa3Mypr2E4pfZuYfDUw2nAO78cMf5SB8kQHFUZU1UczHwPeTUM4lMOi4nTtIy
	 gbk2Qu1EubUGP+yAZtuJNDAts87mLZ5ngbOvIJDEcTHVGP4rOSrJgG6KEtu2GHm0shCP/
	 TeNpE5wm8uSIes5UxWRYd2g3cdc+g3Ei3CrJtzfpvyRxlvbE3fVFxouw7e7AMK7Z0PZgM
	 o9vzsVnFd1otVneB+EiZBoNjTROg6JqhJEE8JmYwxMWiZUnLaKnGF5Ksu5ovWSm5d0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=H4FGooqlFWyqGkh+aQ/av1H1BBYV40gcH/hlMVUd0co=;
	b=x3nCUhsnsWaUT+9GglhJt2dq8+LdanCZNaEA1Mnf5t+OgR7FfoTScDR4mQ/5LoLGbR1Z
	 bTRmG5kDFeGGB3YCANJTRUEbwA89w3rvwZQ9WD4e4sFSMWrXdxvvy2HMUinYyN7RgWT/n
	 bbpdtUz06CHPvTzHTXgva21bwFcV3R8yzy9XrJOAWrddggYl37n1t8zzAsTxQjjVGoFlz
	 aN7n8xYRV6c+0bqeY74nF1AcJ528nj20GIViHHLQ/jtQTzSwiN25O3qhMWPW82L+jpQ3B
	 ikZdM5t/sdCTkH2Ia9OD/AEl2PXHaD5iZ3K2rtGx2otLsi+qZyiaq1ToKFcW0ULXvJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=9elements.com;
	spf=pass smtp.mailfrom=9elements.com;
	dkim=pass header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b="I1S/K+J5";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9640360A3801
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9640360A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=I1S/K+J5
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso12083925e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1795201084; x=1795805884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4FGooqlFWyqGkh+aQ/av1H1BBYV40gcH/hlMVUd0co=;
        b=I1S/K+J5WENcmKIVe+se5Cu55JBojsi/lBc2bisqSx4Hn5tZvCqCM5eiexZXWFPHG1
         Uz0mKIipl6OORTGKhJC7AhxciFbWcgaZdBKkYxvuXVFSBBadh7XG0Cwg+vkwP+QT13zW
         bLJ7q3sr8/ifheeI/Dg3j4g8l6L0xMCnmFuXeBuPS1OsIgnouhmrouGaeJI7aotn1BUV
         BnRkij4/NyHfxVlRH+Q/OoEd8qmuD93JcBvmpdTuHnJ7zAQ5ctwffFow170EYSi6Ejav
         5vIY+R/FXsCtVzjHlCYZtJ/I8Y8BFhGQ3oxm7xdmf9dk1PJdsM9mnHaEhj9/BDmWm3eq
         lEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201084; x=1795805884;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4FGooqlFWyqGkh+aQ/av1H1BBYV40gcH/hlMVUd0co=;
        b=vojWKxbPqLL0o5gjCF2HreRkZ5DcXA3zKRkUtadviWi/9uKFJ6dIOrXreyYhUfCk3t
         SDSwtMHtxMSYaqzN4wRZmWHf8qoN5KB2A3NOyJSLBTbZqtZ0lDtu5tCh7TP4yts/ZHdi
         9t7QWrc4kxaWVeFPbQokOH4lPVN55ql7jQpzonQA8SoLS4+efZ9QNYTfPIEfe2Wm8+Tt
         /f3flc+uLXUgkRkkIk9WxgnyxHnpfP5xTRUDgr4PPIDW9Q4Gmt9Pt2v+V9qEtaZay+iP
         oJBzf5zzYVGQoWhSH/2od/4HRoqX3hCb2d427tsGW9NiiwVx/bgaJo/hlX5RG1dAvd1J
         0bHA==
X-Forwarded-Encrypted: i=1; AL+hErGbv8U4Gt8Ge8Pmq4H/03O49eFYKB8EbrMSMvX3BWS8XWuZYGs05PbHRu/UuMs4r2TB5KeJROzc+Ol8j14=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XzSnqIdHc2KMhXCx71LOGB0Okbt5WauCb6oePpyyfq5AkMWPS
	P5F8D39XTGZXbkmuywDJgoXSIX1OSfyIdjRbvn2ymCjTiIAfwlab9tOb8d1FKWwQyxw=
X-Gm-Gg: AYBFou1fO25TkgI+vSagwOUZyFV6XizF/nmHFYj9jezUJqlZfgLafFg3aP9vtyjIV4l
	ZxdMRSmE+th6dFhz3Z9LRwvh7RM54XIYaqeT5xg0IAaHXoAMN7l1ASampSzBjp4anUKcXPLPKfq
	Mje5Q7Fe64uQ06gTze4qg38bf49YNwMYOj1LpRbrIiRtqXwbNfUReLEl+P+P0C4G+uN47bvYTii
	k1xJVYJQGYKaQQ0PhCTcLn/rjUt4MiQtOqdGGw4ahOaevY8dOhA9Hlu0etsh+J8dy00qldVPqir
	DOp3bQmYECxYDPsPvYhFGrccPkwIiSzRLrWppLA32O4y9g47/xKYLz0SFLYoTV/7r7tTPrTVJA3
	Falpxz/ZWyMo369K3og+PNC7JK69pmMonxjA3ZPAzAClSvVNcrZXBjxIgF9RMR9nkbCt6NcBbOY
	g6x6zz2njQbHJBiSYAgaNwksNKdU3L+jLqj4qqpYtvmu9j+nyaJt0HXwlU6/cIzLrS0CTqk943O
	U9WNZq9GCBvVx7ez2sKcFnzx7CotqMsfYQ5YOYHZG42mg9QsQkuHF5UsYxfvK+f9fxTEv2FCP0f
	MRrCcBmfzuZUJK52ZCRXx3HUS6Y2unnesrxESa5SPh/5np2TfDMtRkU4bQ9i2O5NIb4467MUVp9
	GS7E8n/YseW6tQGQYy9+eTu2ey+0=
X-Received: by 2002:a05:600c:3491:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4bb8880014dmr95550835e9.10.1795201083545;
        Fri, 20 Nov 2026 10:58:03 -0800 (PST)
Received: from ?IPV6:2a01:599:241:b744:2c96:9736:bec3:7db8? ([2a01:599:241:b744:2c96:9736:bec3:7db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm97210445e9.1.2026.11.20.10.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 10:58:03 -0800 (PST)
Message-ID: <9519e889-8c78-485c-a31d-28df8b7cecc3@9elements.com>
Date: Fri, 20 Nov 2026 19:58:01 +0100
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
Subject: Re: [PATCH v2 0/2] nvmem: aspeed: Add read-only AST2600 OTP support
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, ryan_chen@aspeedtech.com,
 billy_tsai@aspeedtech.com, neal_liu@aspeedtech.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, srini@kernel.org
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
 <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 6:44 PM, Prasanth Kumar Padarthi wrote:
> Hi,
> 
> This series exposes permitted AST2600 OTP data through root-only NVMEM
> for userspace diagnostics using raw offsets. It adds the SBC NVMEM
> binding and a read-only driver adapted from ASPEED's downstream driver.
> 
> Changes since v1:
> - Add the separate binding patch and rename the driver nvmem-aspeed-otp.
> - Poll once after a 1-us delay; retain the 100-ms timeout and log failures.
> - Initialize read mode once at probe and stop commands after a timeout.
> - Use a fixed secure-prefix keepout and check the live SEC54 range on reads.
> - Simplify copying, locking, configuration and Kconfig help.
> 
> Tested on B650D4U (AST2600 A3), OpenBMC Linux 6.18.24 and upstream-based
> Linux 7.4-rc1: repeated reads, cross-pair reads and 40 reads from four
> concurrent readers passed. A 12-byte range matched the saved ASPEED-derived
> reference fingerprint. The 7.4-rc1 RAM boot used the working OpenBMC DTB
> and initramfs and also passed the final-pair comparison. ARM zImage built
> successfully.
> 
> AI assisted with driver revisions, validation tooling and patch text,
> using the downstream code, review comments and Neal's hardware guidance.
> Hardware tests were run by the submitter.
> 
> Prasanth Kumar Padarthi (2):
>    dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
>    nvmem: aspeed: Add read-only AST2600 OTP support
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

Again, please fix your threading... Other maintainers and reviewers 
already told you in other threads that sending a new revision must not 
be "In-reply-to" to the previous revision. See the "Explicit In-Reply-To 
headers" section of the submission documentation [1].
Consider the use of b4 [2], which can handle it more consistently.

Tan

[1] 
https://docs.kernel.org/process/submitting-patches.html#explicit-in-reply-to-headers
[2] https://b4.docs.kernel.org/en/latest/
