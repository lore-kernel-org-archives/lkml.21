Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795546526;
	b=nMKeKySBrNj4Ukr+Yw1a4MR/qkZVdgQv+Iq5gyAYyxJnNDW5FwOlzyyv5rgxMbzv43WU
	 pW533L6do2xBW89BdEHEc/X0dCuLFYE3F2REMSdjIXgZkZyUe6jSAPXW2BjvydnJgvxN6
	 +8uymA6aKpHM3XHTG/IivgvYunoZJzvTOS1i6SP+q4lEZ9GM44tyYIm4FT2g1TgoagDjC
	 497Qj89s2pKczFiaEU2+GQy0MRrQnZRLWaPEDWLfSLj+a4B/hI3bjlg7Sv0zMuHndmaM1
	 3NK+sy3p0uFVoZbU49b0QJIitacR+C2jk6WN3pPEzghjZKSWWbjoCuWJnsWVneEoi/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1u8Dtdr50GkWxwr/o6Art46QnZZWoGSZDLZvedZdu3g=;
	b=Gp52PH3H4EzWKdhP6Q1Q1BwxGqIh+vulL85y7gYRdhxAnOO33t1ti9K/Hby8mJDL+k09
	 BlJQ7aABz27yroe2zrHrP5FpDzhvpuMZO6DAWVFkLTe62H8J73Si+xMDAP7A2wqlYRavz
	 1GeULPZtk44Nl3+kTPuw/IgSBQ5GoJVkWZRQOzQC8FH+5AtvrxG0hDkj5i4vamHH/uHHj
	 gt4itAXW8xkMQMS7YUMwaE0y5DKIj0YjCfz/Z+utuV6P9zhuFhVWhTTpNO0A0u8XLQ962
	 He0tvayzaTwG3FfNJcfgaKCCo36on92XYQGu0dei+tS0SsDICw7nj9fr8ocDM23Z9VA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vz+5HP28;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2AB606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vz+5HP28
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb5b33e2ffso127235e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:55:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795546524; cv=none;
        d=google.com; s=arc-20260327;
        b=oJv8mfgE4Yinu6+8lOIIjsZy8hXxEys0C6OeQ4/HZdR5zw86FnGpyIo2/+uCkVIyw/
         q/IsyUaT5vYQeDDVOAESdwyAfLGQ2516iHw8wR6HstJYHCKtLFNKEpa2FGC+02eq2WdP
         YPrAzVl7IPHMe9YTJNXu3l+bqSQ3elm4v4gFUtL87WKQbs7hyVIWMkg8ynoAgtG4XFIY
         SJLMJkfEUaEwQtMejM3XQGmpegSMe5fqJNaA73jSPigcDqBCE9f/PzT3/RL7mUeaJDdO
         SgXz1CZsuv8Zsgv5rBiPlTe7gRalHXwbAAvXjm6MSg0wo3AmJ5NmAqUa0MMi3xLBiLBR
         eE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1u8Dtdr50GkWxwr/o6Art46QnZZWoGSZDLZvedZdu3g=;
        fh=Bp24yqjEx2rPFCwBxx0L1bKHVVWoICoUOKzuhcDdMSs=;
        b=Il0JjK9wbv1zA1Xf2KNkrrhxT1gN7nTndA1EieF8LdaqODnw5TDHj5v9NJJH+j5B9C
         8yTCXYcjSh6j7r73LRpLZgtZpnnYw0fGaj+mk7o6aKBBBkVzYpxZP903VFItvpyFwcWQ
         +mzF8tTo0RMe5wu4s9fLC1D+B6Y9fwTrl21MsbM47c7hW33RaR7w+2FbOd5CdP+40PDT
         +bwnPHD9x1hNTm/d1Z4pp+R0RMeAnZusF94LtQ21FOM6EIcgp7gK1RlVXjPfMqEJnsbn
         r+9p7LAs4syjH2zEya+p+e/wtYaCYk5gcUf0H+3ZZbDP+er/5Gzsou/lzeE2agglVJnT
         W6xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795546524; x=1796151324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1u8Dtdr50GkWxwr/o6Art46QnZZWoGSZDLZvedZdu3g=;
        b=Vz+5HP2869Z5ONW8Y9OVdf/1LqgOzZK2Y2POGAE2IeSEJXBWuGcBsTqNnhD7kYfpK3
         rSw+ii//1wdSuglD1QviPlArcxERzzQ3x3TZ/cVQRm/xf9GAJvcBPYvP7rkPTY4dBAn0
         DNOANmiVCizIcZjr89te8FclDZEEQAGW+kvy6QXEhnEQuZrkBf8rUMj0cSAdNHpFX52g
         fwdXfpWeuPjibt+/J4buOzFwtc0ZorwGu6cQAkLxDQ+XwGJQoedHLGtSKh5elSWf2vfA
         KBmdqtzhJFh/ydpeLFJdf4tf+Qbwrvtdjfs9UBtaMvsRfUhB17OS+klyMr4j93nZ9eWM
         5SZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546524; x=1796151324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1u8Dtdr50GkWxwr/o6Art46QnZZWoGSZDLZvedZdu3g=;
        b=KRGhRCMOnUZA7DZnzYWtRNb/+6FLy5/Wb4nO/dFqbThAMi1isch9WZE+2eww8XJdSt
         k5sKz8aH35R1cQRlAQL4e0ceM5eHaCNMCDaYHZ7CmqQsHcHz9JAhN4o1d7AXQjaOEfjY
         CZC2DZ699Ql28s6AzyR7U5YfGep7gkU1dVLI+nF0IiWsJAWbGxv1nyDaLBrhh/4J92Pi
         vhlg8FKL7+F6xgA8Ae8dXBnp8dmHhBFfJbcPuJrvQFOcBNDY4sQZHq8/Ine+97oIKp31
         aHnTFzOWW8kfVZcU/lvsIr754iSW3hdGYOtvU7ED3dc2nYYxKYxQXQGwlQKXc/ZRWp10
         2HAA==
X-Forwarded-Encrypted: i=1; AL+hErE3u0MwJadXiGFzk91MGwnXS7zd9uf+XkWkbgHeKS3apoqOPEL2EyPDhK19MyhIU3bWueHM0zcoTs1U434=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LfI27g3NsS17zEOqjGT6JiUWyMNW8zwLOzWy1rrAho5jV01B8
	oLU48iJmiUzhGxFocfvpbvyf6F3rpkaWpthTyNrH+6pYjXq07rS/9HKh8zntcS1TKFGsKfw0UhG
	Jc5X8Dv488v7VU3bZWB0m1uC/V5YbMrRGDKxAzDR6
X-Gm-Gg: AZFdTZfTmXzN85Htx56OoPYy+NZwiRg/seNPXrPTJfr85rN9iJ8OGhEuUaL4kQI5kNY
	+rrWRCyht4YUyMlp8IJvdsbV4ExiIz/lsm6rZMDGu30H3Eyct/1eCA+1jtxtnn72ysGXEzkuymh
	T/pqqrnO0e9ycBVSf2wEKzr++IqvTVGxa0IBSvfZ2FDPscBqzsPddi+B87j3eD5EuWVgumpaBdB
	exf1+Uduc/DVbl92aNbfGUUfITQEylUFJyk9D2fdKPFQ+hMRVI5t0Qjh/KCuOl06/B5KZtahjrK
	DHeMVoeC9YDEyUWLT5Ygk3EeaRkdq1A+w6XRksfDICpq8PN30fMpdWr3unHng18vFtj+pCitKzC
	RtezCsJgAzr0vXEC5tnCavbUSUl7d7Y72Z6nQYz8Txef+/uZ2z32/kEl+JS1m0UO/ZGh5+ilDGY
	vFCmuILiJ3CLo78+ogryB9QsA/
X-Received: by 2002:a05:600c:608e:b0:4a1:e7fc:fed3 with SMTP id
 5b1f17b1804b1-4bb916aef09mr3131205e9.13.1795546523926; Tue, 24 Nov 2026
 10:55:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-huge-pfnmap-fault-races-v2-0-276007e73bcb@kernel.org> <20261117-huge-pfnmap-fault-races-v2-3-276007e73bcb@kernel.org>
In-Reply-To: <20261117-huge-pfnmap-fault-races-v2-3-276007e73bcb@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 24 Nov 2026 10:55:11 -0800
X-Gm-Features: Aa3M54rcD7lAjqTBZlWobdm479k0AAUvm_iZ5SlmrfOCMEFaBN5uZR2IYPu5xbA
Message-ID: <CABdmKX3Cfv9wO3SuzYOg-+UXC=BOSAAPRfMQUAep6JStd0DjUw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mm/memory: do not report OOM if insert_pfn() races
 a huge fault
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Alex Williamson <alex@shazbot.org>, 
	Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Wei Liu <wei.liu@kernel.org>, 
	Roman Kisel <romank@linux.microsoft.com>, Saurabh Sengar <ssengar@linux.microsoft.com>, 
	Naman Jain <namjain@linux.microsoft.com>, Michael Kelley <mhklinux@outlook.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Eliav Farber <farbere@amazon.com>, stable@vger.kernel.org, 
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:32=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> A driver that implements both ->fault and ->huge_fault must anticipate
> concurrent use of both.
>
> This can happen, for example, if a user calls prctl(PR_SET_THP_DISABLE)
> concurrent with faulting, as that only holds the mmap write lock and thus
> does not exclude faulting threads stabilised by VMA lock.
>
> This is not currently safely handled by insert_pfn(), however, which
> obtains its PTE entry via get_locked_pte(), and treats a NULL return valu=
e
> as an allocation failure, returning VM_FAULT_OOM.
>
> The issue is that get_locked_pte() also returns NULL if the PMD entry is
> not a page table which can happen if a concurrent huge fault installs a
> huge PMD entry between __handle_mm_fault() observing the PMD entry to be
> empty and insert_pfn() being invoked.
>
> This can result in VM_FAULT_OOM being reported incorrectly.
>
> Fix this by introducing and using __get_locked_pte() which returns -ENOME=
M
> if a page table allocation fails or -EFAULT if raced.
>
> This allows insert_pfn() to return VM_FAULT_OOM only when an allocation
> fails and VM_FAULT_NOPAGE otherwise so the fault is retried.
>
> The same change is applied to insert_page(), which only impacts DAX (whic=
h
> has its own locking).
>
> This means that insert_page() now propagates the returned error, so -EFAU=
LT
> in the case of a race. It's not possible currently, but guards against th=
at
> changing in future.
>
> Similarly, update walk_to_pmd() to return -EFAULT if it encounters a huge
> PUD leaf.
>
> Target the commit introducing the first driver able to do this.
>
> Reported-by: Eliav Farber <farbere@amazon.com>
> Closes: https://lore.kernel.org/all/20261112051440.16140-3-farbere@amazon=
.com/
> Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
> Cc: stable@vger.kernel.org
> Suggested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
