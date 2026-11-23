Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457761;
	b=ry2xuQ7ZV9DHA1E47t1eA4ZNUipIpKSvmZinkko1+lXntcxYiEu1MXhlpMCYzeq4n63V
	 mzrBOzQX3kPHlHYVeEycvEJWJkM/P8m/Y4b3YBUXv7dVhNWpqDM/Bw3MAGQTNucb76RxI
	 JW7sq+lUh797g156p3ggP/c5/bk+eUMowEgVMVTi6tKdQlKYBZgEoAJ5DbZxv+2Je9Lkq
	 jesLStJODYANqxhUZ8ZOXvoIB/BTHQAFrDIJtES1Hdd2wq1PuZwLrHyX96alPwugM+CEN
	 PJniNgDIyILf2+VHeKOUZMUNI3QYQGL94Wg5SIMCP3zGa2ldtJn33gQDmUayZW8jOzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=TFQZ5Vfgmmi8vCbKTEjvDQ3KYqVEpaJ0qjUpV/3d3M4=;
	b=rA9TtstfaKstAezGfS0Vi1jtDYpA9psSk+t+wIaJtZEOtoKY1KCY1JUES92kpJfAepMg
	 sDrt/QAeHJNGxS7+p+u8cqY09gT5vpc9X6hJ5diamU57uUlJBZG5O+Ill+HKO6WgJ8pye
	 NnwpEiyX/ihugFQs02agt23sZyPCJ15K2SXx/iNhEgpjIEmjx8GodSzKr5GmSuu5+2VEJ
	 FyN3SFgV6H8/U23MiCnclAM4R6tHgVY8WDSccw2nWQRlpql21JzAih2jU2aHyrDOMb1rH
	 MS54bTK/s0O4fR3sX1Klfc66od8t4XOuaw69txQy8fVxlovTeE+AM2vOlm5H2JmfjAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SnwkbDEy;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA37D606A334
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA37D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SnwkbDEy
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f05b465cd1so16040165ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795457760; x=1796062560; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TFQZ5Vfgmmi8vCbKTEjvDQ3KYqVEpaJ0qjUpV/3d3M4=;
        b=SnwkbDEy7R5RfHQQSfC2IHq5U5qRGFOPZ4+4QU1jhS/YzWsRlnPiO93us36lhFnc8u
         YNMjrxA7nuB4U6dKaj/v2yM647DDyn5+EKHe+cttoR4aotNCn73ospUsA4R+SShhg3c9
         qaNC/RohSxY8x+n3JgJLn+oZT1BG2OeLoZAZKjc0RhtfPNw/dBUYvibafyH67Wo+/2Z1
         GzZoB5xSDV8TLW+9QAYybiArBeGByysm5iR/ZbCPWwg2vz7nf92dBaHu6cxIaKQRNb9A
         k69ZOgu5aF6ijnNWZ7UMHNU8AFIqd3m09CkOgswuxwtxxsLKCLKWTfi7UG6lfHoLDAKd
         29ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457760; x=1796062560;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFQZ5Vfgmmi8vCbKTEjvDQ3KYqVEpaJ0qjUpV/3d3M4=;
        b=0PcxgM6/hda+AEXjHs6lyRmOXPU4oniwKv+eOH5cE3CRcvWjvHM5NZ28CDG2eyPFcS
         dA7Sp4GPIe2HkNdrE0/63mHE5lTMHZ0XqfpfqIA+72vAQ49CUx54RT/bxzjolBTPiWAO
         K6ZYt91tDcftXIfchXBCYDdoNigut3VK61kDvDQcI0Sq+56xFtTHWjPuVosAl7c/J5l3
         K4c2lBHbKXlEkMA0xtJTPidUv1uhkFlMUOyVLimSjvymiYd13RRyWX5UVRYweFMwLqKZ
         LuMd/TM0QNLl59jKJ2YRtpF67uhqA/VZnQ2kbQfen2wkt6YW4ib+N9kDXyco8JrHItii
         cG6w==
X-Forwarded-Encrypted: i=1; AL+hErFLMSDxlNMEm/dYDtJRoFVkRWiuJk/U5DUaoMd6ce5ZN/3vEvuX/ooLrDL4bzsP9BGfOmRdAUDfYsOcwrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7M2TPE8ZKthY79IGKuK5882oM+zA986FqeHEZ/0PAJorLEMt3
	vjMD0cVEU2eFDM2aLk1/kNuYa3aR5Bnf9iih09J6hLLJnYgVo7Ssfy+cLPYq2Zi5mQ==
X-Gm-Gg: AZFdTZex8a1rmTnt5tVHnWv5pDvJmLyfEIcCq+J2UF5nIjZGfB+74nhR1k3BauxiHlm
	jtIl4Evn7/4lNXGft0qgjIqA+Jd+2VgnpUIOLatS4U0xACCd3bwA3vajFjjKUgCdmdPKR+6kXbe
	tJZtGN4FNZxyqRzWaVMIRfm4hN4OusS2rRcdJxWRFyN4eaLbimPSelWTvmy0N3cFYoFUSKqkVdy
	kLn2HTg6nZ4pj1YUysXfFgxI8pB4GTAa9zbBwrc5uF8V/waoddplk4F5xYnGqbKb3p+iOns9hJE
	Xt7jKS/fkiU1NUcbp8386nmn8UGJXj+3YWkR7DPx/2bXuacb6yA5KRhOeUoq5/czktNv4O4UBmJ
	kb53wj1XtQUaniN5kIe4u6HJeCSTN/RoJkiNR15gGbfq2u+4RnIlpyLY6WfBiudyRtSV52o6TSq
	8bLjla8wp9W2BZEIqjkQWuZN+1JFgqT1QfcBLVh5ZswQqAFwpafser76d752e5INjbJZVwzbAzY
	rSmfXiSLD/jrwZNR+kPZJEEZdEIItMT6ZdFap2GFNA8WZTvFejprXG0m4JQvoM8Uz/zHI4YeFDP
	LwQ6d3ejKpmDXBfVmXr0KZwVPsEjdUaShSvkSexxOBxxmRMZAhBtWOCh9m5u4Q9+
X-Received: by 2002:a17:903:94b:b0:2f0:3618:f170 with SMTP id d9443c01a7336-2f03f1acb10mr114729435ad.66.1795457759518;
        Mon, 23 Nov 2026 10:15:59 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm57723715ad.58.2026.11.23.10.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:15:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 10:15:58 -0800
Message-Id: <DN2SNNBMY48X.2HS6KSB38QPK3@google.com>
Cc: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-mm@kvack.org>, "Alexander Graf" <graf@amazon.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Christian Brauner" <brauner@kernel.org>, "David Hildenbrand"
 <david@kernel.org>, "Hugh Dickins" <hughd@google.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Michal Hocko" <mhocko@suse.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Samiullah Khawaja" <skhawaja@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Vlastimil Babka" <vbabka@kernel.org>
Subject: Re: [PATCH v4 09/19] mm/shmem_luo: Leave freeing the preserved
 state to finish()
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261111002358.1842967-1-dmatlack@google.com>
 <20261111002358.1842967-10-dmatlack@google.com>
 <2vxz33sv3ef3.fsf@kernel.org>
In-Reply-To: <2vxz33sv3ef3.fsf@kernel.org>

On Fri Nov 20, 2026 at 3:55 AM PST, Pratyush Yadav wrote:
> On Wed, Nov 11 2026, David Matlack wrote:
[...]
> I think some of this is already fixed by [0]. It holds the folios until
> finish, but only in the success case. On failure to parse seals for
> example, it leaks them. Except, as Sashiko also points out, in
> memfd_luo_retrieve_folios() the folios are freed.
>
> I don't think this is strictly related to your series so can you please
> send something on top of [0] to fix these bugs, and perhaps drop this
> patch?
>
> [0] https://lore.kernel.org/kexec/20261110175855.2437084-3-pratyush@kerne=
l.org/

Sure, I'll drop this patch from v5 and send the fixes separately on top
of your series.
