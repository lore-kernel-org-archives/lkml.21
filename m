Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185874;
	b=eKu2boo1vphM0KFQ2ES1aQ3Wx/uaGYFkuM8f3plUw6NRRMni3qsjPVBpiFaAfRYx8nuA
	 XeM6q/eoN8lCDBKZo9HqJqgTG4153uZnMIFLQot0tQJtjV2swKf/hpCoF5w3PN2+z9DQ0
	 trAefmUVJIoZBvFU54KQ8xI6OHiSih7yhnKP7JMGOa9/891oKQTRAOlWMNDXGeOJ5T9eG
	 erTlZLd/osGveFETL0nVP9bci1PwRJJMvgyjbVZ2fC4lrW7xnggBhbFmJiqFU6p+bVKQA
	 bgBtC6dcewGTtgsjlXIyIfGK8zgKhUsrnN4Rj06GqzUzIAKLNE8Y6mYIWvYfZ0sbLdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=m38xEXFjByfiKAzO4g/0gPgc29AKU9uTE7VRz7Geb/Q=;
	b=C0jYEuiIMCrF+CQjhzW6lluTAyhZFoig/0SZqFDvKpWbFSGxNxiSPTdyT0yDj2HahWzj
	 bAN0z3/kq1hXGO1Xsm0rpFN2nxwbUImI47S7YJ2JCUYTNGo4TjHkm4Lq3HDRBsemA8Psm
	 z+RL5q3fH/eyiAJbee+UFAhiawJ6/VJU3jx4VO9jBGmir6k37MW4kysx5g8+GDQb4J6u0
	 X1Od0+20PdhutJqrRfB3IcQ+NpMUysuIQKQtK5a/UO/WYmvc1hC334g+KjeGG0zmisfWs
	 OigCHvOQuk9zx3TABjp8MWKKL6eQ0VIc1pLwnmq+7b7IJir0expWCU645hpPFKORBEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RL/dp9Ey";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3D6606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3D6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RL/dp9Ey
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49a92144733so498661f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185873; x=1795790673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m38xEXFjByfiKAzO4g/0gPgc29AKU9uTE7VRz7Geb/Q=;
        b=RL/dp9Ey9w11tTYSnWl/GfKTENXwG/NTsBETPFGblppDQ2px8PAe3X56P7oZweN1XC
         eo3I9BiL4fhxrOaVziS0QzQSh0P/l2gU1XFFG1aLIUf2bz2nH7bAugEIZKk21G3NvoDU
         ioMlLkbTNSL18YKm1GT4KKHYu20peTtSGG4aB5hXPk8gAq+HvxdRlOdnFhqOf/SYwEHi
         QNt/cJKkXEyF/b37VPqpy+p0E6Wd/Orz1e7xxlsGjP7qigYzw6gPtpAdtnuGIALnuEA7
         drhGHInsVCSxt1rp8XNZYbADgUQj9FKfgBs3DTtVZe9DHkr5ry1Az5JtH+OuDFj65/SO
         in4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185873; x=1795790673;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m38xEXFjByfiKAzO4g/0gPgc29AKU9uTE7VRz7Geb/Q=;
        b=0RlQoiHG9RJLjtxjaoJrTc9rPVSIv8NcnK2DzrcJb1/sHRkakhye73PkqrgZHRMxg0
         RY2vA+p+0rscfSeCld79VFUYo8lL6VO9o6o7W7tVasUAOuaE7rO7X2jnphvaL/jKdeG1
         wrnToZXszt+ad6378w/lbISpsa1m5VZYkqPm6q1l/Xa0BCqpUmyQyFJ5RSKhTQJekyyx
         rlLrQsG1tj1Dh00VGOONFB/MgJUUjzdluN7ScmqXV1T7yv2I7ajdu8S71edQC1YN6AvM
         RFUANAKyEorCdM5R5N1PL1h8lrjFOTfe9hEIlfAsy2V4NNvBzYBlro74m+NRiHIVwoxa
         Ywww==
X-Forwarded-Encrypted: i=1; AL+hErHWVODhBigQATO5tvzIPKWLA5pRgFCFOBL8CPe7YVDSEZvLXioauP83U/7sjkQqn4+XfEIfWfcKtmfp+bE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X7nA2+18bYNVU0LP3CkWBQVwUrf1JFr324xbbrssye1i3kyWk
	e4DW0CEwKG5SeUpODdkFlHB4VXb7HD+BSm+5a8TX09LeqGC0Rn92OAW2NVgy/u7s
X-Gm-Gg: AZFdTZf4oHYb95XsdWc6Vr+m7BB3R2G2JC/nur95r1FB65sTWtl0lzTrKnno6MbG7/q
	Gtr+8pViT9IxvvGm5wpqW7ETQjfZfRijL40i5xeiQvFvryI1g4okylxB2SqEJcMBGsSTAPERnZo
	WPXzeAWFQFlXNA+e1jXP2aYPvvfUpfxvD4DHfgyWS31KMCwRhZd7cL+hkxEepue+UtTt6wVsj0k
	MhHoPxWjp221f31BeXhvxF0WbrQ3827GPruh3b82BpS21iRiUHet9UUaDv6nyrr2xjC/ixgErsR
	OGxyZc/jWYsIf9CIlCz2PBvDgX7bIQcPoehG5LK3MivqF987oaATDic4TNoVmQZx/JtoDI1f2Hx
	sAXPS6XUV64xPIA84X1c8wjK2HZDbrBTsuJgRJAXDkPdW6NmFhi1yoXeTMuwdO5MzP5aCTmGhoS
	ASpy1jc+iVaXL6VNTIYS+sRpxQbkw16ycjP/dX2HuJ1Rscpp00eaBjKbYy/8fHbpbboba9HYiW+
	6lBYdoTlRPSK6l2sd3hxjQPBabWFmHpNMPq1XQDYR9mBz5Rrc3EtB2se7OtphotXuTCvkMZCZz4
	j/cdoLQVJoWRawH3aTMncUAPDCM9ouVV4MW8MoUts++rrYJAljxWbQCHxDSBA2I2m4Y=
X-Received: by 2002:a5d:5f91:0:b0:48d:f9dd:e3df with SMTP id ffacd0b85a97d-4abb386134bmr6418979f8f.18.1795185872700;
        Fri, 20 Nov 2026 06:44:32 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm5994516f8f.47.2026.11.20.06.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:44:32 -0800 (PST)
Date: Fri, 20 Nov 2026 14:44:30 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: x86@kernel.org, puwen@hygon.cn, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 linux-kernel@vger.kernel.org, yangzhen@hygon.cn, dengqiming@hygon.cn,
 stable@vger.kernel.org
Subject: Re: [PATCH] x86/cpu/hygon: Work around XSAVES Erratum 1386
Message-ID: <20261120144430.0b1b43a3@pumpkin>
In-Reply-To: <22eb33f3-a6f7-43b6-837b-74c8f5a3428b@open-hieco.net>
References: <20261028235712.383977-1-zhang_wei@open-hieco.net>
	<20261120094627.513b216e@pumpkin>
	<22eb33f3-a6f7-43b6-837b-74c8f5a3428b@open-hieco.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Nov 2026 22:12:59 +0800
Tina Zhang <zhang_wei@open-hieco.net> wrote:

> Hi David,
> 
> 
> On 11/20/2026 5:46 PM, David Laight wrote:
> > On Thu, 29 Oct 2026 07:57:12 +0800
> > Tina Zhang<zhang_wei@open-hieco.net> wrote:
> >   
> >> The XSAVES malfunction described in AMD Erratum 1386 also affects
> >> certain Hygon Family 18h processors. Under specific conditions, XSAVES
> >> may fail to save XMM register state, allowing stale register values to
> >> reappear after the state is restored.
> >>
> >> None of the affected processors enumerate supervisor XSAVE state
> >> components. XSAVEC is therefore equivalent for their enabled state
> >> components and is not affected by the erratum.  
> > Would it just make sense to use XSAVES unless there are bits set in XSS
> > MSR that the kernel might need to request be saved?  
> 
> Did you mean that the kernel could prefer XSAVEC when no supervisor 
> XSAVE state needs to be saved, rather than clearing X86_FEATURE_XSAVES 
> on the affected processors?

Or when there can never be any supervisor XSAVE state to be saved.
I rather lost track of these instructions after XSAVEOPT.

David

> 
> That sounds reasonable in principle, although IIUC it would require 
> changes to the current xstate instruction selection logic.
> 
> Thanks,
> Tina
> 

