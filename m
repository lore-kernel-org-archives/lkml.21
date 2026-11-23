Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449726;
	b=qZCPrO8P72Z1blHvN7RLAfXBpF8D+DKS5QesbMzqmrT6phg6jY24M3i9AyMvXkOfbwWg
	 /Ufd440S6Lr8fDEkfuMZHfwnDu4GpW6O8QuFywfgl8TXsdfC9mfCub+NXXAvRPFEcBJnv
	 a7ASTHkB6R3oobwL8wqmAyTWwC+XT/52R1kFGLs1WpgrpKpqtJWiMlKUhnEKgh2Lvn3AO
	 cd5n3X5b/Y8anaKHBWG2Tigb0hT1I3lYxyBHRprMVcN1rk4rcejbubkq6icMB8mtrv12n
	 zvNidbRDegccOjuu1UN1BkXkYNyUclNCf3xrXt17FJF1PfU2w3SCPBtI/0+8sIoeyHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=y4WiymWQ8hbxf306tYMJr1AN/YqV2ygFqoD2QusV7Jo=;
	b=ATNUf8y4RElpCH4YBVOeOqAi7HpMmdW6mlNKlwhX+9K8srmGCm/OrkmF7IgtlvYFF+Of
	 DBeejCzLB3tDJNuXIExvlWP6vQQqQB2PsHi+NtOw5Bvpv0bQbGu6hoqtAFf49xFwydLD8
	 EGPczi11BDhdhY9qd9WhgUjXoCKeZwrc1wKN9zzxiaFybbKxmuZCY0nAuFEnIKMbRXhwS
	 fKcfDfTYmvSwPNA2CO2O01BTKF5HbE3/ivmIYo7VFuYg6doH+UYSJ7+yi01wBRaL5hH7p
	 +RfcKwmxrgQmokKxuJFDlt4gLkiPZ4E/NsKW9lv8QFxDv/5e51IVUDn6ZmrkwIHuitg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+cjp4zF;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AECA606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AECA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+cjp4zF
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38190551625so7193518eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449724; x=1796054524; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y4WiymWQ8hbxf306tYMJr1AN/YqV2ygFqoD2QusV7Jo=;
        b=O+cjp4zFNfTyCftHhvEp8PgWz1Jgmqpc5yNNuU8tbUrYtLdoOXED2bRmT1GTkRwnD8
         CvfeOGTKygbgpKiJq8twMQ/8XNUa/h2YB3OpFbws53r7LYPZlpDH2z8k9vpC0fY21D+3
         XVjDWyaqSDOoFKrIWIxgloMgtYZygeUPdvHa//X6mE54uKyUPzsD0iAsEA3fTHawFntN
         l8AbPo7XDX1cPrz05q8yN1rFQlZ0kspCgwb7KnggEg/WyA/E+OBNVziWKeqYcxptFC6a
         FNEXfUsPrLE3HJ6cIhtarPkELi0yB1m+2U3c+wIoWEvql3lOtfLFk7zxMpFegMsTD/sG
         BNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449724; x=1796054524;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4WiymWQ8hbxf306tYMJr1AN/YqV2ygFqoD2QusV7Jo=;
        b=gYejaImCqYHp0Az6N3bo5UvlfT9RXAKydR3Z45oKXjn28Vh7IrAg4LhaISCjRHH+61
         G7ABGDqerlOc/HCXNQd3EkauLw9lrO/aiTwvs4PpQJzrR88QzDxZp07MVVVP97/9S2Oy
         E6jbZxbgE99LwSnVKcjKfFIrFOklhlBwQiaKnFpjwU9xL/bxrJMRHlQIlcXySuzOz0hH
         vnoS1oTCw5mRruB6H/s/VUJjK309zSgc4E7ac/WhlAf7/bH/a26SnLST0czZGFt9egir
         79R68nz86T1qAbQul2aKLVLnHtIZvBOrDCenPuK0ocEo9qAG6eE7IDaxcojg6jte8IrF
         UF5Q==
X-Forwarded-Encrypted: i=1; AL+hErFkHRk27FPlLva7TImEX4gDgz/LUFmQEoZ/T4zY+kst0ADIzTFXcV6siU6PIsZ4BctRCQreBdEsxINweeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yqthbhcudYVhQzgMNO6Zjtod3Rm/m4muHytdsMpbBYnt+f2vY
	xXi5lmB7xkq4NaAxate2O1gUDt4u+RsxyQaOpl4WC9EMcIAcxqGdO6se6QjwANIO
X-Gm-Gg: AZFdTZew9iAfGHe3fi3h4HjePBc3EwUvRCnyHCBB8O0ZTeTsi9R8KakNyKCX7ucA+fW
	W3CBTNWYRon7KKNjW8F+VjrP/m6A0x0SAv72zOdjGlFS/cioaJOl7LF4M55ldc70ObdPwplYfoW
	ehxnl7aBb5HRAT1PV1RjgiMwO8jTp+hsVvVCiLe1aOcDHnvcKA8vSjYu+zY8LzO1YfTt+JIH3dn
	s7CKWIV31xAzzZJ9Q9pmJkHmvmv9Z3ZizQiUoffvuYD8l02P7CNZbnMqCrD/BiJfxX/9R/bWcYd
	xT53I3TD7bCvmJJcvljUIkFU+07IgcgQWp7W20CwMfO8Vz+d1XqABAFrONucNSXND9Jh3hr7gVT
	JkPSidg/XZPt7Fgx4cqpSSgS6kjrMdFxMEuOx3RwR9olzIstQYHTuVg7deYls5LZLsNO7VzDIN4
	cdnB4XAu7Iu5T05FiQkImi9HOLRiQiu4glzTGeDcc94PJsMbfLMfAnhesqlxKr0/vNrjg6ExqZw
	a8q/irJg5aJJBwizpEW3zeRvHYOOp45IhECufF4qjBZ0III++IVjjOpi+6CYuYcBd47pPiSzcbj
	FYE5lyntscZlM3kCXwto6aPxFXg40E8tlqxrZQ==
X-Received: by 2002:a05:693c:8642:20b0:386:9e22:ca4c with SMTP id 5a478bee46e88-3869e22cc7emr9286882eec.35.1795449723987;
        Mon, 23 Nov 2026 08:02:03 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:b134:e578:f288:cb38])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm38961399eec.28.2026.11.23.08.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:02:03 -0800 (PST)
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
Subject: Re: [PATCH] rtnetlink: fix NULL pointer dereference in
 rtnl_get_link()
From: mdshahid03@gmail.com
To: Paolo Abeni <pabeni@redhat.com>
Cc: mdshahid03@gmail.com, Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net, edumazet@kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <250c2bb2-57d7-4f91-a32c-8f6ac7d55a46@redhat.com>
References: <20261120134548.214126-1-mdshahid03@gmail.com>
 <20261120100415.363fcb19@kernel.org>
 <179525944307.361783.17801110279499293110.b4-reply@b4>
 <250c2bb2-57d7-4f91-a32c-8f6ac7d55a46@redhat.com>
Date: Mon, 23 Nov 2026 21:31:39 +0530
Message-Id: <179544969959.175192.4403952228876691788.b4-reply@b4>
X-Mailer: b4 0.16.0

Thanks Paolo.

I think,I may have misunderstood this part from NET documentation guidelines:

"The commit message must disclose whether reproducing the issue required 
modifying the kernel (e.g. inserting a delay to widen a race, or[[**writing 
a loadable module to issue the right sequence of calls)**]] or using error injection."

I interpreted this as allowing a out-of-tree test module to produce
an issue,provided that it uses legitimate kernel APIs.

1.am i intrepretting incorrectly ?

2.This is general question ,i mean ,we can litrally crash the kernel 
just with loadable module ? How do we distinguish a legitimate kernel 
bug exposed through a test module from a crash caused by an artificial 
or unsupported sequence of operations? is this not vulnerablity in a 
way or design issue ?

3.Don't you see a gap in documentation w.r.t testing with loadable module
in details.

I am asking because, like to understand the correct approach and apply 
it to my future kernel contributions.

Have a nice day !!!

Thanks
Shahid.

On 2026-11-23 11:56 +0100, Paolo Abeni wrote:
> On 11/21/26 12:10, mdshahid03@gmail.com wrote:
> > I tested this issue on both original and patched kernels in qemu.
> > 
> > First, I used a test module to unregister all PF_UNSPEC handlers.
> 
> Just in case the are any doubts on the poic: if you need a custom
> OoO kernel module to trigger a 'bug', it's not a bug.
> 
> /P
> 
> 
> 


