Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795207637;
	b=1JgFDIVfsTOmEJI4G5mr8xysf5+lvFnLJfUSPvgP3+lg+gnHi3WvXrQAb9/K0rN0yUU/
	 knbDKlz4FLjw9BLijbyU+3LYfwLQX55qWLomz2sj2bljV/9WZx01b8LTLPMSVINN3XG+3
	 sjmOrX7fHsV81rg9IXpmaMqxahA/Oh79g8TuWJlszDFeg+6NOUG6H27jnufLEJl2txLjb
	 wZjtSz3dsaylkqulqNuK2AwNXOXqa0lCYMs6KE6X+EP4j7L0JKUfLWJJ7dftSoQWRHoZI
	 xrXXmYc8pPPjfnw5K/lVu5IqlgqUbjiJuCOY4yYNgfOJ31aLoS4CJQV2Wps3jHDVFbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=llVEsGyf8yGSEqiwg3JqL+nGjFux4pEvwSi5fD2JB/g=;
	b=ZqBAh7MdtjSETc6eqId0nY0UEMKE8b54GEZuiBZOiZ5sJoPm85H26eGVA34MMGq4UV1j
	 FaGiC5YAmH+jVBdXLxmeF1H/Anagxoi7h78WoIxD9PSWzuh5JLfsv96BOzIgFa+JCejvA
	 x2u2flBvVkXsNPLLT4Jrxv5YLrXgUKEBkmxQembrdQ3RZluFqnx+o8kfLxROE75IBDk/e
	 PthWXurW9T7zrl4jcJmYobNx6sQJ/yJ+8Bfr6m0p0ewqMmzrer0oQbmgmcykhXWmiMbVy
	 MiOQl0LOnV9IXSdcwTTeBvd1WYoEzRgWlz8OK3O6otTx4jZluNr+57FNFBhQKipPI5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mDAOssts;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E276F606A336
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E276F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mDAOssts
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b8977f2785so1921845a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:47:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795207635; cv=none;
        d=google.com; s=arc-20260327;
        b=Rg1aBCqKL5+zE/xRgU7s73UQcfXcOvOj2+cIaPY9wOFZ/PFWwKzqZn8xH92LFnSXDB
         gaUBUFKtU37qR4c2QlFbN5Vlkfvc7n8I+XdfDsb3HatRcsfzbGUOX5JdmZoodHLom5QU
         JKtqD2wjlMdiNNThNQgBRPKdVB7Htjsil83CWZmLtRnDrGo0wJX0JpvgEge1Gt5G7O+v
         936KxtLbp3hI+NfBSkPszNbVtvyiHQfUDtI6fWWfv7kxRqEpGtgNoX688h3Fztk8j4Gi
         hUCpmbQ/4cZPRlqzqz3ezRfqk1Rob68QD1JBECxtlEtfwgy4qVPwuEy8bb+X8yUVaYrj
         PzIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=llVEsGyf8yGSEqiwg3JqL+nGjFux4pEvwSi5fD2JB/g=;
        fh=xhzSTpuhe+dq4fpiJL8NgiFw80spiWfx1DQhRUsRyW0=;
        b=d0PSx+vtRFGepILfnVAzth2LDhHnmpoJNo2Hkuk4Ln/8nzIeJpBtAAsWor4sfu55hU
         1SW4ElqfZRWwOqpZ8OTC2BDKr8Gk50W6R2CxpEkhNyZULTfXYgW0EF5J0PJ7PIWYuhS/
         ZFLtw4Hl0GDaHt5FPWLDpwkfkeBraURaRZWXIkwUpcgx/BbAeaite+nsRPANNyPoNkMM
         XuX95m677/BCDBv1/DMWM6RDhWDm2DM41cIezbXpjpUvEhpdUE+I1XbKJCjhJ5FfPrj4
         Qv0F6vxa8BcWN+8TsJyAbG+IL8d5jnUoT65unxWzx2VgQ6HX+pN+fi7Fv790YlqJwJQH
         mtuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795207635; x=1795812435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=llVEsGyf8yGSEqiwg3JqL+nGjFux4pEvwSi5fD2JB/g=;
        b=mDAOsstsayaGpVN5mrt0WHqYfJMxVl4xNjlphbORMQuqB4zPnUbAH8YaL5zKoIC4Eu
         F9LqIsRSKgJhEV5v03T+Ql0DWyROGQUMSOMG9rXiKslwSVX+DZGe95zlEpbsvPZ12/Oe
         /1Lg9q5g9eiw4avDt19dm+doGHj/TFoidHrkLUVkXu0NzjOf7FppJD0z5wgyVLDT0o42
         scAWYbqIDKZbrzNtxRz2nSVGye/JKaL+ET7lrUtqhawwd240uLRGeYfjniCwwZ0qBqw2
         Dq3r649QkfCvJq+cnC0iuLmcHbOL56jN1SyeI49SzjDaOGrK6m96yCsK6VRP7oVSXgeL
         mnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207635; x=1795812435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=llVEsGyf8yGSEqiwg3JqL+nGjFux4pEvwSi5fD2JB/g=;
        b=2q6LFE+mZaDg866BvpOdK0qcQOYva1aDLOyVdBjn1HJ706H4DDhUdbgf17gboA4jqo
         Ux2CXFDQvNuuuvIi56H795ZpPOuMjAqMAsGPjCzK8hJK7OaUpuvD2ou4u3k3kGDk0jDD
         44Z0WN2zKriiG1FMpk8x0fMzLPMAInErGil5yJDzaA4uygF+Jz8ihuY+/ov1O4pTk0Yk
         TfZGm+laVg0YNpSgxvpf8MbZHsm2vW94P8MyXwvFN7qBi2UkUZn1enBqv9+jYln40rtR
         htVJaXyIao3QfKpBfVqPJbVa9zKpXe/2Wkc0VKPE5HlZTRLXBIh3gx0ltyxpuXmcUWUM
         beGw==
X-Gm-Message-State: APuU4Z+V81ZWRP9tmtKxpDf7j1OOHljL2etFkI3o3KACQkB/yxTmJYQz
	IMDsq0mYXiP0wCU8j8hCkwAYSXxoyUEx0OT6at00HBbe5J4KOd84RCo3feNj2nfE/F0lGAawEUi
	TbusHiy6FkkESy2o5C+T1q1/NBcQD4TM2/llLF5E=
X-Gm-Gg: AZFdTZcNV6FRQnWjOrSVuF5ScqMqc0w36TYfNeFKYUj8SC2C6L1PG7NNK5r7BIdf+IF
	mrfhOE2obA1AC7ZAuoO6h9/AoOax78bOea/R2bRk7t/14+iZ3LHOH2YoV7+rEiQBiD7+snl4eEc
	w5DY9bxr90gbpyRs/06DxyMXSzNJC3ZBHIqxpaouMksgAnwF/VhUnflUJbWVMijIVMOpxDMoz3D
	4Zr/TUcJ6aX8WTSOm1eFp1j1CuIn+18DP6f1tGPMGgm0OtB6H5mknkmBQuXm+f5hVCb40kIyEv+
	3ewLflBNeRC6Ko02YnGivfOF4Je8sn4rYhgOA8V0IatNxhVK2QKADUz6y8EE4Sjfbn1IlHC0rnG
	1i0ZQJJkmTAbtHBJkwTgHpZhFN5Aq44ujD/up8s1juiyg7SeW1X4VTnpvxdTS
X-Received: by 2002:a05:6402:a507:10b0:6b8:f674:e089 with SMTP id
 4fb4d7f45d1cf-6ba37e876f1mr2474697a12.36.1795207635126; Fri, 20 Nov 2026
 12:47:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120184225.257554-1-technoboy85@gmail.com> <9cabfb96-21d5-46a7-a0e5-df0908fa67c5@cs.ucla.edu>
In-Reply-To: <9cabfb96-21d5-46a7-a0e5-df0908fa67c5@cs.ucla.edu>
From: Matteo Croce <technoboy85@gmail.com>
Date: Fri, 20 Nov 2026 21:46:38 +0100
X-Gm-Features: Aa3M54rNdpAi_ZPAGzdrjgQEZILfET328P0IFMfa2C4FAQfNHEVsWA64zuH6c6A
Message-ID: <CAFnufp1ec4hDOoXCy_NdCEhkYgZzQktvN5RizyEkMQQ9MneRbA@mail.gmail.com>
Subject: Re: [PATCH] fs: shorten I/O that would extend past the maximum file offset
To: Paul Eggert <eggert@cs.ucla.edu>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Ding Feng <dingf3ng@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il giorno ven 20 nov 2026 alle ore 21:03 Paul Eggert
<eggert@cs.ucla.edu> ha scritto:
>
> On 2026-11-20 10:42, Matteo Croce wrote:
> > +     if (file->f_op->fop_flags & FOP_UNSIGNED_OFFSET)
> > +             return count;
>
> This means there's still a problem when reading past the maximum file off=
set of /dev/mem and other files with FOP_UNSIGNED_OFFSET, right? If FOP_UNS=
IGNED_OFFSET is set, are the file's own read/write methods expected to shor=
ten I/O requests in this situation?
>
> Thanks for looking into this, by the way.

Right. For files with FOP_UNSIGNED_OFFSET the limit is the unsigned
one, 2^64 - 1, and crossing LLONG_MAX is already allowed for them.
At that limit rw_verify_area() still returns -EOVERFLOW instead of
shortening the request, and this patch deliberately leaves them
untouched.

As things stand the VFS only guarantees that pos + count doesn't wrap
past 2^64, and everything else is up to the file's own methods. They
don't behave consistently: /dev/mem returns -EFAULT for a range that
goes past the end of RAM, while /proc/pid/mem returns a short count
at the first page it can't access.

I can extend rw_clamp_count() to shorten the count so the range ends
at 2^64 - 1 for these files too, so that the behaviour is the same at
both limits. In practice none of these files has data near 2^64, so it
would only be for consistency. I'll do it in v2 if you think it's
worth it.

Thanks for the review.

One correction to the commit message. The second reproducer is wrong
as written: with "dd ... | cat" it is dd itself that does the read at
LLONG_MAX and fails, not cat. The intended example has dd only move
the shared file offset of stdin, so that cat then reads from
LLONG_MAX:

  $ (dd bs=3D1 skip=3D$((2**63 - 1)) count=3D0 status=3Dnone; cat) < hugefi=
le
  cat: -: Invalid argument

The code is not affected. If you apply this version, could you please
replace that example while applying? Otherwise I'll fix it in v2.

Regards,
--=20
per aspera ad upstream
