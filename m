Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168135;
	b=g7ExNeKgczH3sRoyJ0nAJ5RapgdrzqqUZQEd/Jf2W3KesdNKvj4ip03PvSVAhYBYcQID
	 XATHmHwllhTL2yfWlYoua8jtKD+4GV202f6WTwwyxWQBmAKEW/DzknYlWhd3Zi9sP6u4m
	 vi6bT2BaVevyXNh4eWiIRVC0aV2MBb0w5q/3WhWo/4zGMqy0l2buwP4HNsOXkbKiQtZ1L
	 rLWeTV/tyYnMwO1WYeW8Q9oRKNdh7d/EBlFQ69mVo1uoADOWJ+jRGmZrD+bBnm0Zg0mPE
	 DIY+reH7DUXoD+V6orhjWhum9t5oj76uQ/tSjfzp0GTJzatKiVqTkG8P9/8sbcSRXCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168135;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:Received:Mime-Version:From:X-Mailer:
	 References:In-Reply-To:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=E/BqrsiNEe7N9X/6LzAE99VV6mdYgIQRyh/LOdMxu5o=;
	b=d0ruGAUPqF9ru2ZWXVUfmKjMG9kbllxowTQnfOXhtrFlHD2zXPIyLJJyp/dEv759hGH8
	 A7oVkTm53WUrdUYfYWPHxLU20tR3/vXyMO0g99/8LCnzwOMKhb1XVk2sBUGnJSNP6yeHx
	 vD+gEbfTqQVBk31iBON4omdl05y1+zDhlv/q8BrhdYvdJroDstqJT/jEJ9a3aBksLekVR
	 XsOoPhu5UHZWrC+g9xgnQ9drzu9d2w8IOKN9O8C0DXuA1U/CRizUY0MIoATipDyn8eBCy
	 qKiHbHXw10ovyR91T0kqZaR8JvTKV1O/qszBdyGvt6j4qxtUEq/ujIhpa+QJ7kZDR6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=black-desk.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4FB606A336
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA4FB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be47aa555cso788091e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:48:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168133; x=1795772933;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:references
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E/BqrsiNEe7N9X/6LzAE99VV6mdYgIQRyh/LOdMxu5o=;
        b=IJq2aVHftnUlPrKDa7Hdsh6ff2Hw/kk+tGXBcLeav0wEui5xpCYgJqx4QR4880DqFM
         BGvd9oN7HVzVOQlUh78vn6+WNZ0KTHgP0abgaizPUteUZhL6Yj5yG6IhyXlc7OGMnvBa
         9XsIguAX6WhEgfMvSRd6Nf/oSy1esDPsiAtkQlvznIqthSGQ7htechF2x/XUf+JkUFKO
         fEoC8a09LN1Rf1+/HzQbSWI/6AoBv1lHQ9TkZQvIeSxG9gPd6C8mSA67q3mMbMZz3lF0
         hqP5cGB3mRoRLhGjQ44nOqzBKhGzP0RXhYMhe9JZC1cG+zC/pPBLaXzbcjEq2HeNEPf1
         5sAw==
X-Forwarded-Encrypted: i=1; AL+hErFc85rChoXbz9nMhWGBiBBMqRN0pRviAgRGjYvgTE2xmNJgGMqAdZ9m5FJkDdgTUIFuQvTxqMK2EIVT88E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bu4uEsgya0qBLWDRT1SD7sYJ9A5uepNB4hwTeMyLPy45930f5
	Qo4ZC2/w8yuRgZjs/5nU4ys6nxzlstolZniID1NAL9/vdCeWcCu+n95r78wep1ThEGM=
X-Gm-Gg: AZFdTZfLkGxqPVCUjGoWE0Yh87nB2Ea8Er4QgpWtxt6iyQ8D0sBeNJk0iIc+hO0m+P0
	8Rb45m5lBLJfsXmQ+XTEJRcn0IPeAjlSR+MojWKwTqlBEiniKm+kwbbzSW30lSk6BcYWpggZqxx
	eM9Qr+cRAax/rERvBkCI+x/YZLUScUz6T7E85nJmRkNXYzX48YFlLyK7IoK3vHIGtfPi9pxdMfQ
	XJ55QGfZP5I2w3rfqb+rydnLF1RN6pXE1eGn0kmjBaM42mSWSORcaAw9+qx3bycDiSuO769ery1
	lQehhuUa35WxxAi8t7ya+mdYpU4lPBAeLHusgPlLEqzgkryPg/0qrRBW66HEhsGZhyu5O3VooyW
	6x/H+gNtM5GguH0BnPKPqA62bUqwxTp2FpLtVHVlq6tfoJJp5oI/Ubkhanh+NJrlwKH+qF2c1DH
	VeyXUPMrBSclPsWk2G59dOUl937QpJu1ICPOX094D5+04UjP4ChplBi/EqMkgwvk5Hj3ysQTAoV
	sPlXXcA89C80/PxHDaiNXTE573vadFCBnB9aFZsgMxOp3S/5BmXbOeXWlExYLU00Xreccsx8DDp
	UTYNrCtynh7MTZtQ+IkltIVpXdA/r3K0zqxxXZ5YiMt+fSXsVLFgpeSHbPcPwlnyRzg5XCxABue
	duCqx471BLe+zAh73Jg==
X-Received: by 2002:a05:6512:6ce:b0:5c1:4c0a:49d9 with SMTP id 2adb3069b0e04-5c1bc7be504mr789543e87.16.1795168132815;
        Fri, 20 Nov 2026 01:48:52 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01b423sm450599e87.43.2026.11.20.01.48.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 01:48:52 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c1479a959aso509856e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:48:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFuC60avWOb51zr/7N07MYyMHcwKIzhclXG8FQ+FF2mpv6qpqn0RdOhsmVhFa90ZLkipdhAPR8Dw1vpaRc=@vger.kernel.org
X-Received: by 2002:a05:6512:104d:b0:5bc:b659:2e15 with SMTP id
 2adb3069b0e04-5c1bc7f36d7mr678438e87.36.1795168131847; Fri, 20 Nov 2026
 01:48:51 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 01:48:51 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: Chen Linxuan <me@black-desk.cn>
X-Mailer: aerc 0.22.0
References: <3e4103cbcf7b76535e2f957762174515ef00f08d.camel@amutable.com> <20261119135452.990-1-arpe1618@gmail.com>
In-Reply-To: <20261119135452.990-1-arpe1618@gmail.com>
Date: Fri, 20 Nov 2026 01:48:51 -0800
X-Gmail-Original-Message-ID: <CAC1kPDOSS=w6mU6ruk0f5=V4NNdyr0NfUCA3npNdKPVGx+JVZQ@mail.gmail.com>
X-Gm-Features: Aa3M54ogGYoYwMNHk57gHJJnlwKfTwwkirw9b7KG6c57d-KoNPXDISSoVm4_K7g
Message-ID: <CAC1kPDOSS=w6mU6ruk0f5=V4NNdyr0NfUCA3npNdKPVGx+JVZQ@mail.gmail.com>
Subject: Re: [PATCH] pidfd: restrict pidfd_getfd() to the caller's pid namespace
To: Jiwoo Kim <arpe1618@gmail.com>, Alexander Mikhalitsyn <alex@amutable.com>
Cc: Christian Brauner <brauner@kernel.org>, Sargun Dhillon <sargun@sargun.me>, Arnd Bergmann <arnd@arndb.de>, 
	Jann Horn <jannh@google.com>, Chen Linxuan <me@black-desk.cn>, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu Nov 19, 2026 at 9:54 PM CST, Jiwoo Kim wrote:
> On Thu, 2026-11-19 at 14:42 +0100, Alexander Mikhalitsyn wrote:
>> It it an interesting point, because pid namespace itself it not a
>> security boundary. While user namespace and capabilities are mechanisms
>> to manage permissions.
>
> Hi Alex,
>
> thanks for looking at this.
>
> Agreed, and the patch does not try to make it one. I followed the rule
> Christian suggested in [1], requiring pid_vnr(pid) != 0 for operations
> that grant access to additional resources of the target, which
> ee8323fdc827 then applied to the namespace ioctls. pidfd_getfd() hands
> out one of the target's open files, so it looked like it belongs to the
> same group.
>
>> Currently, you can do something like this on your machine:
> [...]
>> and this will actually print hello in the Terminal 0, while the process
>> doing that lives in nested pid namespace. But this is not a problem
>> because this guy is a root:
>
> Right. As far as I can see this also works for an unprivileged task of
> the same uid, as long as it can reach the outer task through a procfs
> instance of the outer pid namespace. So pidfd_getfd() currently behaves
> like procfs here, and the patch would make it stricter than procfs, in
> line with the pidfd ioctls and PIDFD_GET_INFO instead.
>
> The case I had in mind is the one Jann described in [2]: a task in a
> child pid namespace that gets a pidfd for an outer task over a socket.
> When it has no procfs view of the outer task, as in a container with its
> own procfs, that pidfd is its only handle to it. There, the ioctls refuse
> the pidfd with -EREMOTE, while pidfd_getfd() returns the target's file.
>
>> So please understand me right, I'm not saying that your point is not
>> valid, but I'm not sure what was the intention behind pid_getfd() API
>> in the first place and we might want to have semantics and model close
>> to the one procfs has.
>
> Understood. If pidfd_getfd() should keep following the procfs model, I'm
> fine with dropping this patch; the inconsistency would then be on the
> ioctl side. I'll leave that to Christian.
>
>> To conclude, it looks like we have a little bit of inconsistencies
>> around here :-) [ But please, don't go and change anything in procfs as
>> we might break some tricky use-cases like CRIU and SCM_RIGHTS users. ]
>
> No plans to touch procfs.
>
> [1] https://lore.kernel.org/all/20260925-gewischt-auftrag-tierzucht-c153cb3f9f74@brauner/
> [2] https://lore.kernel.org/all/CAG48ez1T5-tUHVK_iHsgUtWa-inVdrZxA3E-ZCW0iENJvasKfg@mail.gmail.com/
>
> Thanks,
> Jiwoo Kim

pidfds provide process access without requiring procfs to be mounted, but that
does not mean they must expose every capability that procfs may expose in a
particular mount configuration. It is reasonable for pidfd operations to apply
stricter checks.

The existing handling of the pidfd namespace ioctls follows this principle. Even
when procfs may be able to access a target, PIDFD_GET_INFO and the namespace
ioctls require the target to be visible in the caller's active pid namespace.
This does not treat pid namespaces as independent security boundaries. It is a
conservative restriction to ensure that pidfd interfaces do not gain additional
access merely by bypassing procfs.

The original pidfd_getfd() commit, 8649c322f75c, used the following rationale:

> This syscall allows for the retrieval of file descriptors from other
> processes, based on their pidfd. This is possible using ptrace, and injection
> of parasitic code to inject code which leverages SCM_RIGHTS to move file
> descriptors between a tracee and a tracer.

The syscall documentation in the same commit says:

> This syscall gets a copy of a file descriptor from another process based on
> the pidfd, and file descriptor number. It requires that the calling process
> has the ability to ptrace the process represented by the pidfd.

That rationale assumes that the caller can actually ptrace the target, rather
than merely pass ptrace_may_access() for a task referenced by a pidfd. If the
target is outside the caller's pid namespace, the caller generally cannot
address and ptrace it through the ordinary pid-based interface. Allowing
pidfd_getfd() solely because a pidfd was transferred through SCM_RIGHTS,
SO_PASSPIDFD, SO_PEERPIDFD, or fd inheritance would therefore give pidfd an
operation beyond the ptrace-based justification in the original commit.
