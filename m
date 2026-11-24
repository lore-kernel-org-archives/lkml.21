Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510627;
	b=xZ5DMY0PGAZNFh0vCbgI9QhikMY1sn8cesALP9++AVJIcu2q9mrPCNx///wEUV9O2Z7D
	 zfBRsqyi9gtzoTP/QFuCal0z7x2PwLBPErWpV6kE1E0an/77aqzzAcdDbBKlKMGlXVmIo
	 QK/RI5XuVyeVZmI0sXKCTNKeCJzUxQSu1AwtsrwTwfxMHIXsbyI1lwuOEbRCqfwB0j7oM
	 qkOw1SW232q5s15UXbqaYGo/VWivWQjpnPQT+gQOKNFilWpRcOd14Sll1KmNMyBjGAzPD
	 LH6yxk9MXG/YEwKOVhPZ/jqcaevmA4OvBzNkU6IzEfTp1+CFMqO16vxQkOWZTlFHCZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510627;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+WBd5f8Kes/3EruJ/MjE9jyR5igXBI9F5RvCiWOQBYI=;
	b=zX2FeV7e2sBvQ6y0ASb0cqqpqBC/PlC/DIP821KrUbftL5jOh4S+IrHmGHQhxGS1tv1K
	 qks9hWFZCoScFgOS3+PQxGN8saCG1iyDZK31+hSpo/cNyWC1+Xs+MncNFxLKfrAGiCpSS
	 HLjynhwJD7j/Xjev0vCmmbGK8K7W2E+Frs+z6quNEimR3OBNWekk4fgod44Sbf+3h4n1c
	 NjqzG0jJGvZ6TfEGh3JUpSpFiuey3vXNrlgAGGiUmIxdhmolkwwqYzr6RATUuX3peElOf
	 aLmW6SE3PKQHsh8Cd2D1lJg0wRHIX1K987u35W00BSbFFW07rPrXQFF4/uKXQQFCnuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=av91O9lI;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LWL0vBZK;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909EA606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 909EA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=av91O9lI;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LWL0vBZK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795510625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+WBd5f8Kes/3EruJ/MjE9jyR5igXBI9F5RvCiWOQBYI=;
	b=av91O9lI6AzfkF+umZNx34y0Rd6sT1FN38ledZEN08s4JwCagRsuofQZZ+iPbJF47Jw8An
	IlAGzT9XQPG84jtVB8bSeJomXwCq4XUr/4jmKJGQW8iJwpiZMwfB90VYGw7G7HH+lSbQRD
	MPYi5W0twrsDchkmcPXOxu3QlItG15c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-EWJO53xNOsK0f8MfjmcmnA-1; Tue, 24 Nov 2026 08:57:02 +0000
X-MC-Unique: EWJO53xNOsK0f8MfjmcmnA-1
X-Mimecast-MFC-AGG-ID: EWJO53xNOsK0f8MfjmcmnA_1795510621
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4903fc8537aso2734784f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795510621; x=1796115421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WBd5f8Kes/3EruJ/MjE9jyR5igXBI9F5RvCiWOQBYI=;
        b=LWL0vBZKheKhouleQ77PCyfkPF7K6p93c98GCqyNYF0u59d/7+NfJoHUimqlQVCGPF
         dMo8hg+JGIKGiQoPLesb288qrsRNn+vNmWlGtbcCb+B6DR78JhLcybNnkLjkhdX2WmGF
         +owQ2tPC/L2Rj0v2TcnTFjU5zDIA8VG8fte57MasWgFvrGZEJheIqaLyBrOoEW/ncJ5b
         G/S86bSpuZD0V1PH/t2bxCCUYCgJwd+Zub2YkjHPkeCHizBI5fDCCcTKXL6KYCu+kBJD
         9jYdZbflfJKDes/5YcEixs+ur1zT31MboHE+dO7qBTyaOgodLh+2jaM+NFtPjaK97lRe
         wmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510621; x=1796115421;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WBd5f8Kes/3EruJ/MjE9jyR5igXBI9F5RvCiWOQBYI=;
        b=V+C2p0NhZvO5bS2rYqPF6VQ6Lr5KRZouOmHfkHTKSPVxI60bw1gvpaYHJg74UlQh+v
         gd1qllOJN+Zs1hILkNX7ya6xDJbzif6ECJy0MoXvMzszoILfpltX6VwQbhYun1wqKEot
         6DtM3x+Hw6zCfdAzu8uCDfOs+PrQMDwyF2Cm6Z+3SfF+GfE27Apjk1keVuFo43HaoCbf
         3/Qeebmo2bFPqWcCjftLYgOx/rRcE2mMKCEIHjcnypNoc62dmOJrFrUQfY/0BEi/UMo2
         LWKCCmoS0qVlrQCEQ6q8/kG9tRnzVIrXJuhpdNuGmAOMrv/90hzAXd6KifwI9ejs/Y0v
         Jggg==
X-Forwarded-Encrypted: i=1; AL+hErHZUD86uod+TdmhF3DuCMom9bx/3mqoNeVp6uv7GllNebbuh82GgBLObwKV3x5MqNv9gnU87WPDQNjJjJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z80zysLModSjMSwMYHwFXzeqhUnz8nsaLFc3WikFwOkFESRi7rP
	kje69T/nCmLGlSKzsrn/SngP9O3K8mZRfBA80Wzj6Qv5GKztc+mSVUy9oN22854Tj64CMydVSkY
	gj9tmPgz51eIuRaEeBZbSxrLc5A166B9p+GefJCjaaiQMHoteG2+1upF+M8KSvuAuMw==
X-Gm-Gg: AZFdTZfog/uIkZYrSzMaBu2/Ecm5Kxc8BYv74itgNLjfLUKkBHMT458gEq0Dg3dwgz2
	rhsFr/GUirrXVoOb5JUWMJO5tIbQl9Mzq2sOcXTXynJFMskaFYedNuM0zUgUEncle50neXummZ4
	qP2rK8nRTJtGwhU88zzxWdNxl2ksFt5clI1z17KkGd27VEip5BpKsL6xnsV+qp+GyOdtlD4y9aA
	Xy2JDwP3svomydFUt1IgBfSxRxmoZXBwpFsAy7paDFwdDejpX5dNGKhweZwKA67XCR7vZJO1mPq
	UbkKeuN+O9ESPPELkwz84/4RDPpsMbAceLbjDGPVeLLnE+cpxHc/DMQnepMvi61x09tb30ZxE8R
	wua4pthVRo4wFq+nI/5OQgYAcp7VcRNSY6G6gcN5Mo79Xvaq2e+yCtcrhUQz6D8RDEuUOFHuJ/K
	x+3XWuF01O67I4uYP+X7H54p6TuSzja/2GGV2vWg3GLgia
X-Received: by 2002:a05:600c:4f4b:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb888226c0mr341148625e9.27.1795510621204;
        Tue, 24 Nov 2026 00:57:01 -0800 (PST)
X-Received: by 2002:a05:600c:4f4b:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb888226c0mr341148205e9.27.1795510620822;
        Tue, 24 Nov 2026 00:57:00 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm26574444f8f.32.2026.11.24.00.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:57:00 -0800 (PST)
Message-ID: <41103c9d-5c08-495a-b5b1-66fc15e2517e@redhat.com>
Date: Tue, 24 Nov 2026 09:56:59 +0100
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
Subject: Re: [PATCH] rtnetlink: fix NULL pointer dereference in
 rtnl_get_link()
To: mdshahid03@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 edumazet@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261120134548.214126-1-mdshahid03@gmail.com>
 <20261120100415.363fcb19@kernel.org>
 <179525944307.361783.17801110279499293110.b4-reply@b4>
 <250c2bb2-57d7-4f91-a32c-8f6ac7d55a46@redhat.com>
 <179544969959.175192.4403952228876691788.b4-reply@b4>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179544969959.175192.4403952228876691788.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 17:01, mdshahid03@gmail.com wrote:
> I think,I may have misunderstood this part from NET documentation guidelines:
> 
> "The commit message must disclose whether reproducing the issue required
> modifying the kernel (e.g. inserting a delay to widen a race, or[[**writing
> a loadable module to issue the right sequence of calls)**]] or using error injection."
> 
> I interpreted this as allowing a out-of-tree test module to produce
> an issue,provided that it uses legitimate kernel APIs.

Please do not top post.

The problematic point is the 'legitimate API'. Adding a delay under
a lock is legitimate, de-registring core functionalities is not.

If you want to use a kernel module to demonstrate an 'issue', such module
must do exclusively things the kernel is already doing, it should just
enforces specific timing/sequence that must be already possible in vanilla.

And if the race is possible only with such a module, at very best the
issue will get low priority.

/P

