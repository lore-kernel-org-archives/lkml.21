Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.217.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795135830;
	b=lpWUPbUSOLnys+Pt216BzvRJW20zxBog5AXcJ+AatjVsUSvkWuZZm0K5REK2vPM5tLbw
	 D3GAgFxjVukm82q1D2lJTqZ66FEIiJdf07RTX8kzwSwo+ceH40/1zZsLkHTPYppO901Hv
	 LJ+IX7N0SKqOWvtA2V49FkfJD/PrIC+/VrYsAE+hQ/wBJBMEFFMBxcIX5qzuHWER0bJFm
	 5OtaIxahabZKxji/Gc8g9tZlbDq+N6mzzedw1F/8NWN1YZF3JhF1OcwIHOnG2JbgDS8Aa
	 JFOs722JpjYYiR6OKE3Om0m9kG4Pun/oDnqFit7tpyjamcoPB57+HR0CIqzsVHEWo6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4pQ/jBdCGos9KDlJt1J2TDwopdBtnvMOQDgM0Dw4Uoc=;
	b=GcYNS5Zm6fY0RAa7HW293LlJXi31g2NTfHPkO8i4ZkbM20AfurYVFYyAhQieIB8Qp4aU
	 tjpo31GxyuPWQP3Zt7XyKZ+NlZnQzEeiOR9jnUuKfSw7U7ZhbP+bxTVcnfDBu2UqUEpfC
	 MoihVhR8NpQgVAdTsDpBLi/YHpdDPR5fkLxbD8b8eqxdGqmi95lccW5zM6kx5bCln2NbR
	 x+/dgkqZZqN82FDPWgyjFzahw2TS+5wIAtGlFkszjEmHBwA21XqlYr2a54Pzk62zI4fq2
	 sl4uVp2AvDj6aPHpVdgUeGczQ/2jHwvKFmvPyKHFpuHFZ/lKpZcwLgS8Hgi/PfLFY4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AtGdGmCq;
	arc=fail smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AE5606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8AE5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AtGdGmCq
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7d65662077cso181481137.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:50:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795135829; cv=none;
        d=google.com; s=arc-20260327;
        b=aGmJhpdyOBXU7RYm9YWL2m22NUeC3MS9sUG7edPZlcu+MfqmTqot4FkDtzxqq0Fm/P
         4gCe1cPAqmngoiQ4+NRZ/Jys1hxcrzXJkvkIxIbbqtY4buAi31pTSF5Tad7tjz1LcM0u
         sda06tHPR4MGT/+oyQbG4GXnaCzUpGrxXxnSR8XtzPyma/Nq9cK/qYHmjCM3OAuBF50n
         HFpknx9nsZWjkN+kR7IWP4TQRvfaZbePqeYqDSVZ/9QiC7f8MQULF43TnlHavtSnqKO8
         4mT+TD9x0aRh/bWrTxAgJkZk8IzFd2vP4jfa/duz/Q+OhIikdG66BwlJU4dYvFu6fkrP
         xe7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4pQ/jBdCGos9KDlJt1J2TDwopdBtnvMOQDgM0Dw4Uoc=;
        fh=2VNpz4MekpPWEHCKk07DNft6H9eb6GQcEA2siJYkmdw=;
        b=INX7915cxfKmlbtpmexvy0wC4sZx7DXETZkgBgrJkAgEaVo+UCQH/tEn3fW/jp5tUo
         o39LHujWVdCnZ21PwmKYnEjvT2WT6Mok3bI49Ee318dMDLKL/44a3lGnd7LJKDE9Nk0B
         512GiBhiWnB8vmySeFgCI1kIY03+gkm1ySV0J+k76ZTMi7DbLQT9nWdgSqnKaQUC+Lig
         kgYkyP/LSD6G9CzFVbU8j5vUqK1B571Wb5X92PYSLuPvoRf+f07//WmeR2dlvHGR62M1
         wAK5nkCPk4VwY5SQpq3WKzab60f8TD3MOqT8DG7IrKOg3Ydmc9XPW4LOBAx330UrGN95
         iqeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135829; x=1795740629; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4pQ/jBdCGos9KDlJt1J2TDwopdBtnvMOQDgM0Dw4Uoc=;
        b=AtGdGmCqYWoBagnroC2kHC0RNlIUQFcdGwFSfIhmpAOpSH7S9OzAMR0o0dof16ztpp
         XdEGWoEjYwLoudW4mOupNda2yO2gEZ3dC1vzTXaIBC9Ve/A9Wqo4Gm211szeC/e4fJwz
         xa+H67uKRR+3CvqeVV7bX/ZMWcU2pei4vqImjg5FQJ0VmhYJo1ICNX/BU0AeVCPlYlJO
         hLTboBdfqd5nAnzWH/gwtY6OM/kQXnhwrttMbfXUlor4OKXg4BHgB+9TdJB47/JiiQFm
         LcugDJtKsfoJE6dieQvhm4pB6dPV0dc06673o4joi1IGbyHOycbQkiF4aEQO4hF9HFr9
         +/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135829; x=1795740629;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4pQ/jBdCGos9KDlJt1J2TDwopdBtnvMOQDgM0Dw4Uoc=;
        b=iDtn9r9QRrEZBoQxUj1fxGxYWKMXEihHiOBa2DLbwUuq6FZ+B/CF9KYDWBZQG+XsY8
         kgNrLP4mKyhXZwva4oRchGSuoJXWN939/HOL1hChvA9SSb5C/XTLLZPdrATOGi4F/5P4
         eQwvcXGrqKWK/k45fT1pr6ND7q5Qm6SoQlUYBXmHVFbJcJ1wEipMRCBB6lNBTBsU/iG1
         HHsznl5hNljX8jqg9Cv1LlPrtpbDncURjOLXUHlgwgrFWQnOzn/z200SRhAoUBKPPH4u
         DLv8pncEZwaTEXqgX0BBR+Q0R//EuQpUHmFeiYwZq1D6FH9+N9nB/WPBvBmI1dqnxY1V
         60iw==
X-Forwarded-Encrypted: i=1; AL+hErFD6cixYTAavkvfYUetgCNe3D0f4EmN3BPsaKxqbwHYIs29C1Juq4TLS4/YW6SpLQBIKWVd9Sf/EgM1Sk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YGkz7u2q6+UYHVynZOj7c6uMWbN7c1BrrGmiVzuRputbF+MOd
	IoSC79thOXMb6/34VRm8b5cUXvJwGDTxkLsN3SoJaMiEQU+ETbT1V0GoZxfSyYGA9js3k0fhHLD
	mZ7TlZXc+8KR66uHLwhOdcLPnz2fEXcU=
X-Gm-Gg: AYBFou3wl3tpxxyBMwEUheecdGCedRBbhfGMKYMfn+jSyNY2QV/+My70lYVwoZu0xXw
	7zL3bMFldZ4FadcAlhKjlb0547sp4b3XRmtJ3PiEHQscmLRipRJ6bwVAEXcH+Kd57vGv18segP4
	ncG5MWBgTSa/rwemGSZvwAr7IN7QjlwpwmqmrENG+hOgeFhWDfA0x6XU2eQb3HPatbGFO0h9vRU
	2DF93tKXlQ35ZyaGX2j524Hvx7YQ3KypMvnapdRLXGFflw/pFhQeNMP0MaJbNyrhnN9Z3N1oLv6
	eH5s4ZuuEDC05agpAZtbptFjGKt3MxpNnd2DCVq1U8gkYHx5ixIS9RzOPH88jNKMK/eZ8nd4JUq
	Du2LaeB4TM/4iB7ZPVvwGfHUMnU7S8pr4DYjyPEiy0EmngRnNTl0PV1IzgB5usYRtIO7wYdyLUc
	sRmE9XGhkN/gTWxelVjQBU4cjkyk16xjB4dMqCxMzWNSwzUtWE1o6uQgCqtE5fWmtqCpxBv9Ut1
	ebeelDE9JTUl7c9bnK5br1YI1Ecmp7lqLipWJMQLg==
X-Received: by 2002:a05:6102:441a:b0:7c3:f36:c7b with SMTP id
 ada2fe7eead31-7d739460f73mr627739137.14.1795135828903; Thu, 19 Nov 2026
 16:50:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930-b4-elan2514-irq-route-v1-1-44671bf01d05@gmail.com> <75148n0r-r943-9304-n194-r66rnnq660s5@xreary.bet>
In-Reply-To: <75148n0r-r943-9304-n194-r66rnnq660s5@xreary.bet>
From: Waqar Gulzar <iamwaqargulzar@gmail.com>
Date: Fri, 20 Nov 2026 05:50:17 +0500
X-Gm-Features: Aa3M54rs1VLWPrHj2w7hmXHghKJVCZNUY4vPO1mwF8EQIcxkzA7-LKDhDSyrkzY
Message-ID: <CADeB2Yom5E_0MwW=9i6RATAEFBmO+Q+ygR9efN84S1mtKVcE6w@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid-acpi: restore touchscreen IRQ routing on HP
 OmniBook X Flip 16
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 at 01:45, Jiri Kosina <jikos@kernel.org> wrote:
> Applied to hid.git#for-7.4/upstream-fixes, sorry for the delay.

Thanks, Jiri!

Waqar
