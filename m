Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795855048;
	b=zONi6vx10ZCcItI17yiO6muZ1+mclSoFBNsGxnGQvkdPWKxN5YOL03lgRcufXXbcrRx7
	 CnkikPULf8UaaJTNvds5B01UpLmjLPuCaitDSGvV1uNv02EmSVGM8b3s5cTkseWugZsOD
	 NoO08NbIcI81WvHxonRRkx6DkQ4ESZLt3n0qqzVFEWt2tUGKF9efHdt1vaXNZhRMWbfcP
	 zLyLNW1mcPCHWZa+enEc6rCmrtOopPMVbmT3lqR21FJvTpaoW1LyHrsaBEj8YjhJFk7XE
	 S+AKbOX6XQOSi/wAUany3U5dq0mWJ3VhPA0dEQuOYwt48MFO/xMTeT8l7JIReObRVPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795855048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JEtpdBbbvdvLBP+cSNBXw3uIn7TjORLG/mLD4Xk1AiA=;
	b=Q2ZbOwiYcGATgezfeUoiwYEfygCEuzswZJBDbw2ye4VLQa6SUfDogrND/FWs9C9tDFZg
	 HRffQ23uP7hZGak2g/10f04SirPpi9qA3Hm5ccTg939S8MSLtmRI6e4qKr6v5ifednZx8
	 46DffMDXSonm/XVFW9UptAL/Dl2Tc7TDUPt7q8W9ut5/JiOX9A7s3LXp90FDtpufi3mUN
	 yktN3kMbfwSS0H8jQ86d6B+aM7esjon4BuSNZaj75fYlbteexp7vFLIecrLp5NgZ0Xgmq
	 av+EhhakvNA98/jj8WtavGDItHvTY4rEBDOuXhoutX4nO1aJz8Isg1D8pMfhIKxAFaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUKTLzpn;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4B4606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A4B4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUKTLzpn
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso33196465e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795855046; x=1796459846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JEtpdBbbvdvLBP+cSNBXw3uIn7TjORLG/mLD4Xk1AiA=;
        b=DUKTLzpn5Lgl/Dd94CfDShThJ14L7j6AlZvz+kg0+1M7B1kkodrw2ZKPpRiGEQsaN1
         F3PDoqYdu4WhKpATgxzAJGKS3PYatQspGIOzwnOrZh+wRRxioNG8QadpRNa7O26s7BfS
         r/RIGSwTDmqNVHi9krg/Yo8E0T5IZAoy7K3aWc87Z+l8TObkYGd5trYTYgt39fnJK6ca
         P/RJsJ2Xs9KmBbKNYYudY528a6JlaLUbbbDX+Ch1BoYJEQToFX9hjX2rJ2gNlgqbh+5Y
         DsZllgnw9vp8W8D9vuw31097vJsyP1+D+UrkRGLVLU34PiYnuo/X0gs2Tqt5f8+gB9Ev
         QD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795855046; x=1796459846;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JEtpdBbbvdvLBP+cSNBXw3uIn7TjORLG/mLD4Xk1AiA=;
        b=ffZqJGHdDcoXLWmjiHLOrybbzwxzgQflQlc9kxA1vxLBP11WQa94tcNjFUdo1nt9r5
         UDgAJI3oZFzk/aBrf8whVBwPHCPyHUssUsCjA3rCvv2U27vprDFmHz+kL33wK3M6GJnR
         BupAlWy3goj75LhlQ7Js741vZlKZdgvGUwOheLicbCrz7n3ZC6wrQERkDZLRtq/LBiDH
         YbhtipPgYv7GAt7k7qnL7AX7j60wi0RrFKG3JdxQBXeACbpl5BxvxMhdqdLAMn4L6CSJ
         1sCxm9erp+GSvL9SsKYcDhezAxywTNBXoXYQN1Sw2V/h4f9Vj2/TUmIhF+aVNtfXRIgQ
         zAPw==
X-Forwarded-Encrypted: i=1; AL+hErGFaBv+I4J9eZq4zIRXtsRV3Lu+TQPaGYQuDdU5n835NcvbvdZ5hp6vE/p216g95F1aIxEtHPSAKOAoXFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g1azrMRn/vRHXFnHjvzTHMr9YoHhpKF+2uHg37A6USof/yX/z
	Thr6enMgeLp6yK9QRoljR2qki7wL2bWmHw/+zYrfVxvOTJdOBqfAWXWQ
X-Gm-Gg: AZFdTZdlLR82/39sLXNV30mD9idTi9FRcrzE58D1i77l9lEpveqW7JT6LxodCY5MQsl
	xS+dh6obRofVtPLVDT7WXbIqqiTePqRmA3T0aIz9MCZub+j7Go0V/vqXKaKbYhaIuh2gGYibyTv
	tBDUXmLznVlNQ7vBd6afc4fqCu/r5Ll8+jkqOPk2T0AXStU4ONuVVO/7J2hvTq8Wyr06lOiia1c
	8blJXo8ajCuQQcd62PoIfHVn6H9VvRc6UcBRPBYo5eYR7U2LLgQ4QYgEBv3P7tt4vn4EeV4aGyB
	tnUot3rf9ozzNqlSWHngEXCYoGtwEvUv/kn74gJ9y6ZYwuXhBisOf6F7TTGRut6My3JNGPEq62s
	Lh6uq7fTOCDrdkTlNVSF5zlw/To68lXUeofG2AbgADvHDJXc56LFH9P4pMvs38HJZuHNzHke+2w
	1fGr2hO88GqULDODwmKC9NUIaQrsCivMxQhoVskR8xEOoO7GwBcyozJK5TqYYDxSyG4sJ4yyBDb
	ZrhAsdomzejZ97SGbLaeHui1mmfxDQROqI8gsfLvoQmKR/ijU1SnDcWdl03expV1RSY1Kg5f6/V
	V2W1uLCi9zdZUN34OU0xYqS64QTbFpjgplK4QYr16uXy5tUe0YiebjtVkpde9HLlZDgnLaNybY8
	uWvM8R/Qmd1oHA2JfRJ1w+9F5X0BRu8feoCNw2EpvpCkLaMyMjumh3R+1UDTq/92z5CU=
X-Received: by 2002:a05:600c:1da9:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb88819294mr563181405e9.30.1795855046143;
        Sat, 28 Nov 2026 00:37:26 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm52893674f8f.2.2026.11.28.00.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:37:25 -0800 (PST)
Date: Sat, 28 Nov 2026 11:37:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: akafelixab@gmail.com
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fw-management: align arguments with
 open parenthesis
Message-ID: <awqSwYyS4KWsxaYL@stanley.mountain>
References: <20261127-greybus-align-v1-1-4c096948e389@gmail.com>
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
In-Reply-To: <20261127-greybus-align-v1-1-4c096948e389@gmail.com>

On Fri, Nov 27, 2026 at 07:24:15PM -0500, Felix Huang via B4 Relay wrote:
> From: Felix Huang <akafelixab@gmail.com>
> 
> Align multi-line function call arguments with the opening parenthesis
> to adhere to the Linux kernel coding style and fix checkpatch.pl
> alignment checks.
> 
> Signed-off-by: Felix Huang <akafelixab@gmail.com>
> ---

You're working against an old tree.

regards,
dan carpenter

