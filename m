Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795441240;
	b=YCXxaUxyI+gzEO57/Ojx33sslhE3HUwMbDZDHpD57jMfKq7vywKbuOk/o0CGDooKGddA
	 v08sQSq2LyuTLsvpgT9KkeV7sKnjYWX97kbEISC2XHjcnec64rsBQKD4hHqf3Kj+yNwqx
	 T4FEYHa7UcbtEdeOsrEU+AKr1R+IAooX7B0ITvklRCbOl3aiWUp04rBiFiwqBPbLbGNZt
	 dcUjdVi/qSuAWNY2ZD1A0QseMrJmrV8AMGk5A1UuvzzrHIO8f83aUh5SH6cuUaioBU77+
	 bY4iTOlutnQK9+Z3XvoGhqNPc0f24Pb7xGxPzFmAHSJrBkvSmYCjZDEn90aUmH38RJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s8GkoF4Y0/ft7koVRoDNSDYckCyyov087UPkNw1u++8=;
	b=qhDmgRSWq/dGS+xyvNI+qrp1oQsVYa7XYNa6bOYtePUncf0bsUun3vYJBTVgmaDO6hbX
	 ZkJ86cTdzGm3uJ8KTHSWYL19LwEnQ2Be5PkA/gfmT+z67K0y7RLNs3JuMcAGQpRVtSPEk
	 EfvuKVHFd56/hpenAc9AgEEfEu0jt1oYWWyLQisZw/5lX0cs0Y09s3hmGyIuiz2QexAuz
	 c3tFXD9EWKMuVzUwsSnvhB1qx/9BOH8grpr2UO9GRLULEZeVQDpCNjqnLCYuV8upJtzZA
	 0NSjsBSv0w/GkF6u99O/iTd8ezXpCNLpCBGVdvd1J8EKYEs2Hk3qFKZDHLM1n/ah+lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=YEPEIhrS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDBA8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=YEPEIhrS
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so4206944a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:40:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795441238; cv=none;
        d=google.com; s=arc-20260327;
        b=UrX+yl3VlXTuJNDgui09UwM9YOTNc1RLW/+Y6njKVLi3HKMWxtzy2aRQRzQp1EmjOy
         QaV2hu/DoymYhpPvfv703R58ZblASkh1S4pPIyW/eBjaXeE9UerEWr3ugvpkdGVyjXRQ
         8wN2r208SvSOMceh4osHGu6GlYlbCpmlgavVsankzjckHLindO+wbW233pPLCr/wwgeI
         46YHdvBCq/qpJiJc63h+KCU6lh2/afb0i35G2kKp+6LA6JW6VhS5qXdvv4c2+X7Xdmzj
         LneGvjhnxvQFWqKxNO9xkP6rkzORgh1Lj7RIzzkaq/GKv6gKYFHTWNG0LAbEMKLAMCmQ
         BXsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s8GkoF4Y0/ft7koVRoDNSDYckCyyov087UPkNw1u++8=;
        fh=7WTgXUpw1J4tcrONIY4nl6xBB3VmIyy4q8dDRk9bpoQ=;
        b=Yz4sEg1l+b03sjXgUI/jqnjA5eqEqZCX3cwEl/4IAvh8Go9RtoCA3mxImWlIpbdFkS
         jD1h99Q6IlMU8xnpF7XvSOzuZ7tPPqkQ4wrHsYg68LX9MlRwiqeDWEEXrWSr4Q6I6c0a
         Otwtoz61r1Sc0j0boS+W/5bSnuA/zbVSlI42HyQ534izt36w/m5XUMyLDfOYEOUO04ZA
         aqI/7yh2cH4IPhxqT24PcWpB0/9LIyP8noGnvitXinHQZgLNDGf5eQo+fLMhmBrUcPhq
         +AMVsKr32xV5Dvth6boq4F6I44E2V7Kw1cU4pibqEUsvOMJo4SNYvH/dmAheGqtKIPiz
         mXSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1795441238; x=1796046038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s8GkoF4Y0/ft7koVRoDNSDYckCyyov087UPkNw1u++8=;
        b=YEPEIhrSw7Mo/1snAwEWtXXrwoWPKFfdzvZXjWa2s7ycoCqNoVkAFjWYVjj/1t57U/
         08j0B+j4a1dMnjaQJMUgWiqZc12Z9yJ1q9ZZBRdJzTRX9Rqg45mmNmI1kIcecfz9zEvG
         qB4aR4jxLinVh1d9X6NmfH0seZSowoCWzTcQPi4pd1SqnT4NS7295Ng4WrhJvUiXLBy0
         EeutDbcep87nGJ9UUKg1uTq5Z+a8LtEh45YPDnWVrqhmztqQGvvg5Sj5TvZ/GgQEbQ3O
         IrsliL+x51DnZO4fweV1Xz1h7Tc6Pal+z0982pYGWSCLdzGS51FBHv5YWQSaX5+WyBM/
         6abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441238; x=1796046038;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8GkoF4Y0/ft7koVRoDNSDYckCyyov087UPkNw1u++8=;
        b=bnv4ZO2b6AtnRunmL4eWCIAgY7FLzFhA+JXUO6or2bgGvgVRJgvV4wSJ8ztP6CbXmC
         P/OjgfhUH6engqqGxXgN2SSTF7c+sTsOy1OcpY6OkHdTIlzt6QCSjdKA5jmkMR//tP6V
         1EJr8R3wRXf+1IvvNYWj4p6pUl2Zz6GqRCilqhr0ZxfZJ7ukz330MMFEQG4GaiLAz41h
         TohI4MoEaC2/pJnujj9OrPFupl8d5fu3Bsefcnep3n9nPeR442P3/XU6JUmYZJmz9Ueq
         G+upH63VVnnbtGp0ZMv5F1Z2vFgR+3waQ6frttwe1cP1xGQuGMaqDONFWxiXDehm6ZTK
         zKfQ==
X-Forwarded-Encrypted: i=1; AL+hErGOn/Hs/Ob6wwzObQoQ0cz23tBdW2AP18zLpYaP7+SLj8a8CpzLelfpiqzIQxD1iwQQ/l4Nk5wIcuoYFCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lnkzDDmcsZzJVYJjQ2CL9d1X2ulZwqxg0rP3v+2waOwXQgBRg
	0CFsL3joWqpnIv0vM1WUmCZXGdwU6jVjFPcj2bzGCek9MNEzLh0/ra96zW7liiQuMA+1YmFd+r+
	XncfsarHG/6LQp296q7VfhO1dVQahbDG04M31dRWGvA==
X-Gm-Gg: AZFdTZcGwWdx+JNbnyBuSYfmdQ3xdMIcjdRnGxyOdoqa7n9uH/CjhWPs+x8Gg2Lb+Sh
	qc7LxlCzYbvaxJphHjVpLtIBjt5ZlWvaPB8mEflItfmPW89J2TD0FTm1eIKf9HB/RG5cG4BJAWH
	OH+qeetvEWFLOpQDdGu9MveFnxi+Q1iuEYGZr30pz0t7YHmBQCZUdukJbmY1aI5/LkZwvLN7nOy
	r+T4HC9fm/RDQAkwKa5lM7tta39BDPpIUljftikVGNyzOne1O/S0pXatrjiVOy8PxpjPzaoPtJk
	W8NNCwM5F/04BZOCTndMnVpXzZSwzesSOEZUX7F3feGydqt6L4BNXkB2cannzVeGaoU8+AUz7Sq
	fhRKT5yxtIuQNwYlFKxZ0I4RGU8jTrt+YGJl9CT99pORvn8nWcvOrrvtH6nURWhgu8A==
X-Received: by 2002:a17:906:26cd:b0:c41:26b8:c49c with SMTP id
 a640c23a62f3a-c513a5db1d6mr705781866b.10.1795441238134; Mon, 23 Nov 2026
 05:40:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116081403.216452-1-max.kellermann@ionos.com>
 <20261116081403.216452-4-max.kellermann@ionos.com> <CAGsJ_4yZznwxOZmfeB2SpgT1enRbQMyKnN4QjEFdoN-PJi7mkg@mail.gmail.com>
In-Reply-To: <CAGsJ_4yZznwxOZmfeB2SpgT1enRbQMyKnN4QjEFdoN-PJi7mkg@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 23 Nov 2026 14:40:26 +0100
X-Gm-Features: Aa3M54rKU_f5FEXDCm7DW4j2_TEpJvEJvFs2TZ2jyZi7ub4II_dViU-T8MrTO6c
Message-ID: <CAKPOu+_SL_XBzgREAgptx8mVouOBg9xVj7q-DW0cyNHay8oHjg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] mm/mglru: cache the last memcg node, make tail
 insertion constant time
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:53=E2=80=AFAM Barry Song <baohua@kernel.org> wrot=
e:
> So this is the case where the list is empty, right? Maybe add a
> WARN_ON_ONCE() check before this code to make the assumption explicit
> and catch potential violations in the future.
>
> VM_WARN_ON_ONCE(!last !=3D hlist_nulls_empty(head));

Added, and I'll send v4 today.

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
