Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261088;
	b=tCjq6lnkvAA6i0ydzZ21D9p6NaF1N+sEoKYPJe/6rMPm1+HH8hfymNiRYEUqnZOCaSQ3
	 sTDDHZECbpjPSsSE0H3e1lAx+Fi+VSikRmoMk2ZM0JFPkS4OHGgA1fBljOClEVLeBxzZK
	 sbglzVpe5f5P2HlIdzEmgwZUd4l+Pl0osGG1OQ9bDi7aFuOodR9FzqWcMoDvvOxkDvxvC
	 x0OCb6OmSOXf1pGIMXPTfq8WYTOIfo+nbX7EwtbeSMJUoRo/T1JdzqR50W3Cbeu/TvGX0
	 DaTcFoPsKsEcy7EQa0EoFU7Kh2BjG0ePiD6aimlMueOlLbO/wt+R4IneC6ml/JGb9Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261088;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=lVosdxg4RJc1Hvv/2ntEefM5buqN5zltfAvwotrV2zw=;
	b=DHN0mK0Q2uXZkFZ9SHG26d31fHRcCB6NzbjjNhHqvwKtfNzmOOd9Sa76IZLFW3yTk4+8
	 S3/Q75fAM+ayieeZ9I6VyoPGKI3jw4i/KJRJcBJ3GF35b6heKUZg2CRof3Wzfh69x2xFe
	 OtPyJ/TMrTm6+ucHnhn9clW3p4D2XTlkYtdrtg4+GUdrO42eShXOMC5cazviAKEVXy4MS
	 Y86Y7xrv4UMqUYCJ6ZnQxt2FIUuXkC4Uoew4wHOR2Uysgz1GDvOqXxuYdhYWI2vUM5nSW
	 5EfNPlKNMjJp8sVniNAB6yAtLl+fdXB/oyL3TvLrW/kUmsg62CLgUD9/q3DSEfzz6hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b="GF/Vamqp";
	arc=none smtp.remote-ip=79.135.106.97
Received: from mail-10697.protonmail.ch (mail-10697.protonmail.ch [79.135.106.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36305606A330
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36305606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=GF/Vamqp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795261085; x=1795520285;
	bh=lVosdxg4RJc1Hvv/2ntEefM5buqN5zltfAvwotrV2zw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GF/VamqpuEeXunY4O6y4CkbyT8ujvCPTYsk2IAkpSqWzsM2n+2I1Khb/qTu4JGeft
	 XgCySP9Ev/aDqHZKJZa0VDYxfuwUNBMIj88Q+iOEBPYv8Mo0G6c6tuKTBSVUf1Hh30
	 QAVoSwr9luUY096ZYYBrlPbGG6i3IAYp/SMlopk1mpxDn+ZgYsh5/DrpzHKe16xhJx
	 HVjpdvFIm9jWwr7UGegvfghbSwcdlJAlOi81dhfX3AYzo7qUXFACNX/8NwnuBKV5id
	 WjdeJ5fJVC4/tYJOA/HI4vnxIADXTRp4zamum/KlprDag/pih5u0mCDBApHqVigFZg
	 0ou7NuPqUKQ8w==
Date: Sat, 21 Nov 2026 11:37:59 +0000
To: Christian Brauner <brauner@kernel.org>
From: Laurijssen <laurijssen@protonmail.com>
Cc: Laurijssen <lauserve@gmail.com>, linux-kernel@vger.kernel.org, pjw@kernel.org, akpm@linux-foundation.org
Subject: Re: [PATCH] SYS: refactor sethostname setdomainname by introducing shared helper
Message-ID: <XW9GPIKTDBldNwwBcXL2cF4RGMFhAYoGyKDb7o4GzppHKF45vtg1bIpZRi33kSkpr-p6q6YFBPyPWBekn-Og6WB9Qaymp8WgiXzX0UlNzU8=@protonmail.com>
In-Reply-To: <20261120-geprobt-virtuell-festnageln-d217f708ecbe@brauner>
References: <B9DD7F6A-A760-41D8-8809-D12F3F178326@linux.dev> <20261112081132.14183-1-laurijssen@protonmail.com> <20261120-geprobt-virtuell-festnageln-d217f708ecbe@brauner>
Feedback-ID: 76652164:user:proton
X-Pm-Message-ID: 68ba93c69bca9d68f4f2c21c5679557743207520
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, November 20th, 2026 at 10:42 AM, Christian Brauner <brauner@kern=
el.org> wrote:

> On Thu, Nov 12, 2026 at 09:11:32AM +0100, Laurijssen wrote:
> > into a new helper, utsname_set_field. The existing implementation
> > duplicated validation, size checks, and uts namespace update steps that
> > are also needed by upcoming changes in related syscalls.
>=20
> What upcoming changes? If there are any, send this together with them.

This is just a cleanup where the two system calls had the same code with on=
ly new_utsname.nodename and new_utsname.domainname and enum uts_proc as dif=
ference. In case another system call is introduced that sets other new_utsn=
ame fields it's only a oneliner to do that now

>=20
> > The helper centralizes:
> >   - updates to utsname()->nodename/domainname with proper locking
> >   - propagation rules for shared uts namespaces.
>=20
> There are no propagation rules for uts namespaces. The helper does
> exactly what the two syscalls do today.
>=20
> > handling. The patch reduces code duplication, improves maintainability
> > and prepares for future extensions to utsname management.
>=20
> It adds a line and a switch with a WARN_ON_ONCE() for a case that can't
> happen. Seems like churn.
>

Nothing fancy indeed, just a cleanup of duplicated code.
