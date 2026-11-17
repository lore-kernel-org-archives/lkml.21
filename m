Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937324;
	b=kpP9uIUGbleH+gdxhUxG9nYRW8d47Sc9Mn/FWAIu70UnBOD90Xmx2Czw8IXaqFglBCUe
	 zihsTw3DbvO4bMjVeLEp+fpKZDBna4q6MqqOp1aRXNOExfcUig+63rAzTw4I5l19fs76Y
	 2Oz3ZVdDZq5AJSoicEerShddFDRmSUCCl7A3skZos/N6l+HDM1gAWRhAmpP1ia832vZ/f
	 GR5CmQW+wP9yI6fQoG/ek5TpX/Puk+3kqrkPGXdmC9qlcWQhDYemyIiJJgwh04yWlkSdF
	 bGOY/EatSx/KqkKZ6PG2zP6GS2bpQHKLKXX243jDbI+luvuINNU9LwsKMTDCRnJjFgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w/O1llxQjJQ6flYIT42pXL7et85J3uKpR2Je+X6X8uA=;
	b=V1tfXLac8+BJdWglE3fxuMBjGp4UVXzY50ivBIKAu2apq5P890Pp7NvS4cX7s+v8OF3c
	 7mFPYiuG5wvac8unsD8nsZzgo9Fe4T7vCGEKz0EFyD8w/9/TsvAeRqrDct5rieMy9yaHC
	 nNBhhUxvjI5NpjsVkKy6pUV3tqOTldnaDXAiJjXFbZWx+PLjF3yR0Fv8pNMSVjpubytHP
	 8bARc2nXt7tzEy7wrL5yyedH0MfbO9dyS3GdvBVl2Nk0/3F4qu07b0YrNCsa6oGJKklD7
	 TuYgjFDkAib0sFZAUUr0vAr/aoydvDq4HygRVwJCXtc0VIn6avq+tMKGIv9/hvmiMsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aa2Xn945;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EA4606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12EA4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aa2Xn945
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3acef9307c7so1268691fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:42:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937322; cv=none;
        d=google.com; s=arc-20260327;
        b=MK5atkXqD110KhqGakwgCoGOdgUnw0aLI7GvzFF1V7cOD2zInSBRckhyiqkDoOgwso
         CUDFWnk63BKtun/slzZLHQqBxsshzypdUv2dT0ry82tde2/AhrrgZ54vfPkUAwZyh/TO
         mAgIELKHpsR0zhtNgiazfhrB9Y06JCfM/N/ZJX1NbD4ETIHGoNhoJl0g0bCA5HC9K2x9
         Aa0NpmZiJ8RnAu5e89Ag+UPMX6eynZeZ6gSic6V9oG+j9OigMu2BWg19BeYMt0RRE+sk
         XqeyCcwGr0QJw6rOSxRj5X4upwyvtZqLNKKjDym8X8hBMx0/MA60m5srl9b8xv1VoXNv
         sRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w/O1llxQjJQ6flYIT42pXL7et85J3uKpR2Je+X6X8uA=;
        fh=UKb6ZfP0qtGF6lv1YJ16ovB2VrIwjARRQCaPZv7iR6Y=;
        b=Wp4xg3ZmgXeIDIdHarVVuidrUsSQlFH2Q6h3nHdnDGjc+7otI0AMXzlwcVrssHA662
         f188h+MdLWzJe+HorDnH2EWf6MomSVG2vGxoUsL86gfwlLVeXM3vLXtMz61ws/GVuxTm
         QTr+KDsfFuBD2+KR7k5yC4JCQ3xNA5ngDliqAequptuCPKc7YJ+gXEcEe7K/dFq7ggvT
         HKMklm3AscMyoyCPzfRuxnVHF5n4vduHOz/Nn4fy5LFUkyrf6jXoIsGKCuyrMvgYm+tn
         FL4nTguWRjVM8L1YFe+z/qKYqCDgrSDnGHTssq/Xqcw8P5o+ngLkNf/PNrwhAkJt+XPX
         2+sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937322; x=1795542122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w/O1llxQjJQ6flYIT42pXL7et85J3uKpR2Je+X6X8uA=;
        b=aa2Xn9451CEdU+VF/KPthEBK7FcV3skgPf3U8fjeg9YS7agKDoSoB8L5MHtXLSDMp1
         A5MjmeiRXu9CFIr6G+HbdriyErRBfWhgO/cIzl/JlmbmJbr40f4c/3uDzgghBqTVEGQ4
         dRAGY48oUiCZL1aXw1xfhGWkwi3x2VayPz5DZCR7ey7t42cMWH5Q/MbCwx4I5Nx+zTMu
         w6ClaRb5yLleJkZx8zRo3jp84PE6QsigFCUlpg7Orms4wDg07sx5cycmCQHaI0NMZ1eF
         6NZ9mDK9Q/57+oiozfj3NomgayTVu+vi6MbCviVXoXIEsrQd92jhjJpiwOl6nytNsLKt
         nMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937322; x=1795542122;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/O1llxQjJQ6flYIT42pXL7et85J3uKpR2Je+X6X8uA=;
        b=fvCk8QW6qxm+D2CtEF1/aeY7LLbsDUjWGGaY31/2WLbU8YOn2nRQxkolvcOXGTGDXv
         LDW2nrK+7ugKD1hsKO3Wucsm3bLGt8vAVNDwdm8yZJwumZxbh4Do28rDioFNSHksLwO3
         kcRJfWwcQMtbO1ziYFcLXTRxCOSYWTpeNb6c/Hpuc/pakTSVgr00psQOTAl4qodUCKOl
         jRA4Kz2fPL8CbZz8+6ifS4oqJ4kTuRiXxn7vpuBCfHUAO+XsEyhYkUGxCtDgUiGIWo+C
         5bOuUiOZjpCzi0EAZX/YfYxQ/KKn4jVPjTXM73Ht+WDTRg/+Ip3qEJBkbXR8c7kVjebt
         JRzg==
X-Forwarded-Encrypted: i=1; AL+hErHf02hYL+KpITpE+RS8pp7jvf+KiJeMagUT2Mo+t6p0LT6d6HVYSXEJ/1a5TqRFIcUoI7aJM3/ozQIT6kE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dNWE6ePaBoyeA+bQyTRye5cwdw1v6CZxX2x3IhQHpkX1eIQks
	Bnti7KZd6S/ZAfshIsRYPxZV5EK9XeKcUVGI3AqjjjjdYsfVyxzIez4M5NS2y8pwfxm9iZjhyAP
	VOkkZ+vC8TENnHFOO7NzZtl6RwHWE5hk=
X-Gm-Gg: AYBFou3E04NRJ6UiVmr2Zm8653qxgxOrsq3KGFbDZQNOsWU/mFnUT36nh321mQH87mX
	W0HlYRyk5/PLGvLb1XSBBVcvK8Wcyf/cKchr1Lp5csAexY1NGkDNTP1ytdoy1oHGDjvEmWIqH0L
	1pswsAP9Ekyjl3VFpypDOTRLj2yThRVdsXfwdhaOBUmfaatc9g/S+k3VoZdxFoJAsPGXFEO8Wlf
	S+Q34Uh3m2SRhOqtWqEJW8/dJcwoqyFL8NgeZ/5TLelKP8zuHm4nlawEg4M1yGIJDUnjNUD7nuA
	URfUP7yrt/IYUP4PjqVMtBUOtgzQz7irY6acIs69NMT1+nBPNs+/UuDNftFiOO+dsj6vFoh85aV
	W/7jY8mw2APQEce3I4lQeGcBEzTBI5vUThAvgYisQ5/mo0bzeJ3kSYYYu7OBv6pH656cNASgH1M
	+MdqxcuYqvcTCw5pJAH3WwOACsG2us8b+sV/BqWkKuSvwFxSAl
X-Received: by 2002:a05:651c:41cf:b0:3a7:6d4a:1c9f with SMTP id
 38308e7fff4ca-3ae2b4f54f0mr39588581fa.15.1794937321825; Tue, 17 Nov 2026
 09:42:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
 <20261109-ppc32-perf-v1-4-a6e8a55b3b48@gmail.com> <6d067199-3077-48a2-80cc-e21352f5c837@linux.ibm.com>
In-Reply-To: <6d067199-3077-48a2-80cc-e21352f5c837@linux.ibm.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 12:41:47 -0500
X-Gm-Features: AclHuK9NyOHwdZhzY_0H8BI34W0hiUQkqAtn_flXFnIyln3e7UfXyG1O1B9kp28
Message-ID: <CAEdQ38E0prYYXVMFSBeZFUjYaSAP6gej_4aTMfL=R4ANrp7y=A@mail.gmail.com>
Subject: Re: [PATCH 4/8] powerpc/perf: mpc7450: Fill in the L1 data cache events
To: Tanushree Shah <tshah@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Paul Mackerras <paulus@ozlabs.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:36=E2=80=AFAM Tanushree Shah <tshah@linux.ibm.co=
m> wrote:
> If you have a quick load-only run for 0x21a,
> it would be nice to see the numbers, but that's not a blocker.

Sure. This is a loop of 8 lwz and a bdnz, run 10M times on the 7448,
counted user-only with perf_event_open() and one event at a time. The
store loop is the same with stw.

  event                none       load      store
  raw 0x21a               9   80000012         12
  raw 0x014               8         11   80000011
  L1-dcache-loads         9   80000012         12
  instructions     10000062   90000086   90000092

The few extra counts come from the code around the loop. I got the
same numbers on three runs.
