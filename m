Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109458;
	b=KJQ7YTsXqA1jCq3ZZjOYGeDYBSWwGntyOMCUvEkuus/QhsXCap1/NbTSe2/z8W2elgSD
	 ZyiGvuPWQQl/PO8gGt5LoJ8W2txVNNTlQzSrutzfabxhkZv8NTwmHMO4yhSD/53gaxG2F
	 Ngzr1PN9DUkujPhmt5Yxnh7vaF2Ac7VTKfFHi4rIXTUNRFTgV4TRr5vEEsF7pnPdSh5AG
	 oYcJC+2vwPQqbTnC6m2mHk4xHEEKmNSFnuhTF41/BeV/LcJfFjhXfMIWzqF20ka1MA5Pi
	 cmXsR3zUrF+rtYrWMtaBoZU6MwA4aYqfflSKZQpBVipnHdh2uJOyARwQZZjT6a4nQow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vs32yPthyobk2oEa2KkdNDnwUJjwL8zz25GmqC5+HvQ=;
	b=ScyYlGWA3IL749fIGWpSH0Swpn4tnv4ntMDy5ZRSL+TqnallZtR0VgyVDSFsolDlKIxj
	 Xrof4Y4VNqazy11Vc/NKck4K3IsrwJ53d6/FtYSYllQK/BWuZRqGUyoGdbPvddYLxSkZG
	 q9YhQETtwNTAlvuKW0Fa9HtwmuBbtWcHZyaJ67kn6zIhL3tawH+PMjrWMc32q+nbdc6P6
	 8xLueffL1Ixa26F8nyvhbnmcY1Vt9uZtgppvZB79J2tBiyL3vRWuDJp+CfwgKZOvgkLBX
	 AQroJXRCr2Ht+2tlSDt9eC+YY1CZB7nD5wy+q25pkyANWiSYJzgnsa86a8sr1pPNyNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=kcyODoF4;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E159A606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E159A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=kcyODoF4
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-92119da3d37so706586d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1795109457; x=1795714257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vs32yPthyobk2oEa2KkdNDnwUJjwL8zz25GmqC5+HvQ=;
        b=kcyODoF499MEItXJuafpVcnzdrYkl7/sScpUZDNuvzQ8x8TeBmZDqdks69cwQJPENI
         9iFlKy+JKSRnJ43XkhGYbKr6s8nEbIsy4qEBpMjCGf/q7zUHm+eoySF82h8iB9DE2E+6
         x6E285TcglmPmUWPzBeIw5GGsOfgrTK54KwCO0dY+Gad/9rpkfmJp+Fzuv7FM12rO3cW
         oVa7V3SRTkJyyHdCmKYhiZ0iNHkbMSf2mGIbRMegzCViN1JkHDoqRPAMPCRKMsFhAncg
         tqPk2hQGV6zgzsjM3kKOt4MztPrYgP6ISE5NoJeIoBzovYoyXvuYXpAuHCmOYhEhLB8f
         9Xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795109457; x=1795714257;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vs32yPthyobk2oEa2KkdNDnwUJjwL8zz25GmqC5+HvQ=;
        b=QMffN3av2Yn9mhV2/+3X8M7UefYXlSLRFHRelBgO6BThNNBAI1mvMvlz2GIuFtr78D
         cSJtMT0rns2XUAT9M4+M9fYTS2u/VHU28rD8/NeJ85d9+LVM+eCGBlycPuljm5PIKIVV
         An/XT1VE35Kw5e8P1lL6vUxxlnTgplnpCup6fPxf4bU6A7Qi9MXkjr0rXsL0daHrOU5U
         wCPLLL7ig1rHVDozwhAGvJ5GzwxR/ZSZuLOqji3/J29oWQ5uDd5gmjgaxIgS8CzibVIE
         6n0ZpultSQljKnZHScIu22fJOa9b0MZVgFRjU553p+IkrNKs49h3+kescLqkbFG169p7
         +B6A==
X-Forwarded-Encrypted: i=1; AL+hErFaWAY1bNZYddo7JJFB1a0hGl2T1JCA8RTpvZnGF1isR39KgrTK+uMJ7BHyU8AsWmKpt1f7jis7ILAK9fw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8J2BpIVRlB50cwWjFt6/A4mDBlwHwt+ASxiNo8LKYcTAtqTg8q
	KNq5pi3MmUG0cFq/yFeDXGRLpVve/+kjLUsYlbU7s/u2wttgEr9cqgcHoHrnRRkPFvS75VCssfj
	FzxVN0wA=
X-Gm-Gg: AZFdTZdZXLnaJB0qGedDhnU1GgFUYm280lrS5Iy758bVo3BNhkZhw4IjIw00VPrOXEs
	JFpt7v53yfDserdJuTtO6ZdMugY9DPg32/b+IYwuney0IHJu26yzH/FZeRA+DA1Kc4CGu+Vb3kI
	iNIhyL39jB2U1JL3ytwZ9P9ygWSdtNjbrchV8PWvKZzq+Bfv8zVmaxpORSxpocKxDZYOxnDbhOV
	HGYIMK+160GPR74RIIlQOowUuJf/SQek3s2/iv//rnZm7AhxyhKXXzLu/c3takDX+44CippgvB9
	RmVcihsQ8jamGg5PhPkEWJlLXkT4d6dayVUd/Q+19HZxi01pj3je05hZuEJceTah3Kv5nuAJ893
	ETghQQy+kMBcFbvQ1bKGcKQpM9WtwMSlWOHoLvlfWTvJLPnshwFCDR6IvKEqqDIVOE+pUVyHDLT
	1UGvVCYlSrC80D4cxyGWDNZFeu9yEuHREROHcF7dGk8UE3kSBqT3sIJ6HshRbxwBb0S04jZMjrr
	3MG7gIEUGVO5hG3U/OUj7LlUrqFvOXUy2ICubxLC3G6fvQac1wIUOcwmlfqmPoeLNMcNUyqqHA0
	qcS5WpAGkFSNrLwA86gE1dG47E8RZd9N3f6v4vLU4yKI3g==
X-Received: by 2002:a05:6214:3d0f:b0:921:2f16:4714 with SMTP id 6a1803df08f44-921349cdc5cmr6310486d6.7.1795109456756;
        Thu, 19 Nov 2026 09:30:56 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349ec64csm3556376d6.28.2026.11.19.09.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:30:56 -0800 (PST)
Date: Thu, 19 Nov 2026 17:30:55 +0000
Message-ID: <9463a969d35a7d5ec5a56aeb67644b94.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 David Howells <dhowells@redhat.com>,
 Jan Kara <jack@suse.cz>,
 Serge Hallyn <sergeh@kernel.org>,
 Kees Cook <kees@kernel.org>,
 Paul Moore <paul@paul-moore.com>,
 linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 00/13] Namespace for namespace roots
In-Reply-To: <CALCETrXPLeUgxyhjP4XuWS46FKB0TUHF5PcMkdMf+qeEXbyXRA@mail.gmail.com>
References: <20261117231352.3816603-1-jarkko@kernel.org>
 <CALCETrVUkbpoFjwSAejyA4b_9qEauAP_36i=O8Op1ifp8aUkqA@mail.gmail.com>
 <av3akYFOYaeQZauZ@kernel.org>
 <av3bkDnwmjunTleX@kernel.org>
 <CALCETrXPLeUgxyhjP4XuWS46FKB0TUHF5PcMkdMf+qeEXbyXRA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 18, 2026 at 9:46 AM Andy Lutomirski <luto@amacapital.net> wrote:
> cells: The dance where I create an anonymous mountns, mount stuff into
> it, and then attach it to the cell is cute.  But I think the userns
> interaction is wrong: you are making me assemble all the mounts in
> *my* userns and then clone the entire tree into a fresh, non-anonymous
> mountns bound to the current userns.  And that clone operation is not
> free and serves no actual practical purpose.

The copy buys us nothing, agreed.  That's just what the mount API gives
me to work with today, it's not something cells wants.  If I could make
an empty mount namespace and fill it by fd I'd use that, the "root" slot
takes a mount namespace fd already.  Extending the API for that makes
sense to me on its own.

The mount namespace staying with the builder's userns is on purpose
though, that's what keeps the cell from mounting anything no matter what
capabilities it was given.  The builder sets the tree up and hands it
over, so the cell only ever has what it was given, and the mount code
isn't something it can attack from the inside.

> cells: I find it *incredibly annoying* that one generally cannot put
> new mounts into an existing container using most existing container
> managers.  I hit this on a surprisingly regular basis.  You seem to be
> baking this into the whole cells design.  Why?

By design.  Allowing changes to a running container is what causes the
problems.  If you need another mount, tear it down and build it again.

> both of you: Can we please make it possible to do the parts of this
> that oughtn't require privilege without privilege?

Agreed, we need to come up with a design for this.

Thanks,

Josef
