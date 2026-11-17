Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939008;
	b=V0+fQXCXTLVqtwiv/mJeDSkGQE/aa6oM3wWMS0AH46NoyXqQ390nn/9zWHauCiW3TlJA
	 vl2WywxlrBWH6UhysnCZr8gMcUMuvbrQ8sygYd6TuDtOWiPbapRUR3UTQr+sGx5dK1nP+
	 LD6sd4lqHjb4EftRF+llEBMcaCxFt+oc2Ypf4E0w7YD6iNtGMPGIvFQpHcnRMzAIQ5fMU
	 L/Uh8wSybaF5DsHJlhgWYj9K49IVt5OPmoa0shPzj+oE9xovgDkQSl/Zwxtfkb2uauycL
	 yMDTnPC8P+wewSngJKoFrmYTsz+c0fSdFBzV08YZKAPHlZdfCTjx2aRen5o0z09C40Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=zLl9OClmWUZkGWYvKltJoOPczVOYmS2IvA8f+SL83bg=;
	b=e8LVANxacf0pONvmEnBzKBNBraDWDbinxRs1Tn3rM6owEWu3tUre40hF6hnODP93ErwQ
	 fuMofMeRqGCwLhgW+vZ7gSYD0aT3plKr8dkwJbn6ZFQA60O1zjOTbYx3sUwslbccYhdIy
	 e0H/RKbL6FpLJ/QOUBkkmaVjYtJjfbkcwf9oGzLPTgGd4XzPb7+3+HfmDPGn06+twcbhf
	 QnVx3p4ItzodZiD/FE2LoaxTZ6DB/+YB0lLuOVM4laxEYov9mJ6lAaqMQaPa+cY4i5dFy
	 JeaE0v+rKoDL8L8zUvQaTSG434qXP6ASU/0QVvpFLHg0L9QU8CrA72F+DQ6LoKYvFmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Amef23o3;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DA1606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DA1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Amef23o3
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso1650885e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939007; x=1795543807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zLl9OClmWUZkGWYvKltJoOPczVOYmS2IvA8f+SL83bg=;
        b=Amef23o3wMlQvjZsjOnwm7SstoI1ytWuWYGcSxp7d61yzyS/6WlGSvgrsR1abN9R+L
         R1O5SMWMagW7a3GEWNuqOlLNcNLrx/wI+skuTD5wvf2u9rrpcTBHRRZ5I2VPjGnkYzQX
         +/C/0VQL6mDeCFxOf6hjaquHSKWrP42NSdrLaIG/trAKuYCdkT6jImMcx3yygj0xgJOJ
         fJAkFwPJIU6i1k0AbQT9DhI9jYVUB1wYvNoG0dEplpbXT9BJFp+OdnPBhRTBZdmbpPut
         I5nXw70vF2Atp5pDt0AXoHd+zkJsr0ban1ivvrFutX8Sll592eKW63CZRlUyp5d+ll+B
         uBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939007; x=1795543807;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLl9OClmWUZkGWYvKltJoOPczVOYmS2IvA8f+SL83bg=;
        b=G6H+U7bQ3P+TDVrM8M6DNzCmlE7dgGT5bZmCfzBrUcf4rfTOO4ToNcQar2gds7I21D
         REw6dmZ+VrDV4+cvRGYP9gbIe3N3aBJP5s4iazGFXEZAeL0JZmje92FadLeYOuo28w10
         2fr+OkK4JpFN1IdiMHOlgAomTMuIO4NNGEMLnWlsrr1VY1wSNl+cW50fJ2J1a8ZrTyIb
         AoEyCNZVffoM7CBdEJYZga5IfejswiQ3L36il6c4LrB6PecShhrJHu7csPqd7OzwD16j
         ZUfbUQwlfujQPs4lLnkoVJdFsLtyvXngU3BrdEgQ6egDgKI5A5QCWy4mZUm9qOb5hFw9
         nAUw==
X-Forwarded-Encrypted: i=1; AL+hErFsVI6CWpExbllv64Y4Kb/Z45IljODMgIyatqT6e4/2shNcyaxSyEQyPaB2/wp3njv28VlME/XLsHJKCNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2hlp6V8QeTDDHe1uQc8pAbnqAI9FbnDNggA4AprBc2E7hWHpZ
	0KCmPGLLhxttxI9Tdg9fM2RJR8DprdrUfxbM7PtnNlZMSnlngZ/gHNiE
X-Gm-Gg: AYBFou0EcDV2zbuCQvRuPBvBnQJZPIu7M8JGhtO+2DUqicaJWIexPzQV0HoIUTi6D8c
	a0+g3X4vGe/OfPL8CzSn0PolMPYGIvZ1iWZYgMCB+pGvzvQCFs9B0YnHu52ZPBqrp+CV/Gasz2C
	UhTW7QV/5efJaixlt+Csp7CSfc3SdDkTTHDhZEtbQkLmfLxp7Pl1ymjhC0wUqNI2ZUHDwKG4Eai
	tdUT62x7dSy8A6nS27XY+oqgi3FPyMIaKKp8dK/U3M7Us1RxeIeq+w/qpAn1vcw8x3y9gWNHUb2
	IFruOOil0RbvuLNnl/D2lJbbTqOVENoP9ySCUuO+ftmfMDIe+3N8moYSgU7XPDB8G2oaCWhIy4p
	hejVHPxXYPaEv/VmUln/IJ7exinIG44ZUIzjQufLckd+3ms54I7ZDG+S/Btv2eM3z6H2mPqQHLk
	wCg99oP0fNa00ri4WhsSJdmj681msYO8dywNb3agCAANUhcHAFj68Q4ZBOoMwoxs/L6Bqi/BPcv
	ehtk72Vo+1N11YxPgq5yF8KJY4Veiv+qkS6NKkzkJmeTaoYsT6DQoWcpXPEA9DHO0gK9wWaeNyW
	YrPXuysQiMv3DSdYSbybdIUMgaf6i9A5/Ws7ADOLYocRtDJOywKsoucw953zlg4HHw==
X-Received: by 2002:a05:600c:6085:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4bb55a8d7abmr308977985e9.20.1794939006546;
        Tue, 17 Nov 2026 10:10:06 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d4f5a79sm987285e9.5.2026.11.17.10.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:10:06 -0800 (PST)
Date: Tue, 17 Nov 2026 18:10:04 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Wen Yang <wen.yang@linux.dev>
Cc: Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/6] sysctl: replace overloaded extra pointers
 with typed bounds and core stride
Message-ID: <20261117181004.6d806dae@pumpkin>
In-Reply-To: <a66d0c11-f13b-42ec-8ddb-2cbddf50682b@linux.dev>
References: <cover.1794844686.git.wen.yang@linux.dev>
	<20261116214023.1a1b4205@pumpkin>
	<a66d0c11-f13b-42ec-8ddb-2cbddf50682b@linux.dev>
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

On Wed, 18 Nov 2026 01:01:46 +0800
Wen Yang <wen.yang@linux.dev> wrote:

> On 11/17/26 05:40, David Laight wrote:
> > On Tue, 17 Nov 2026 00:07:32 +0800
> > wen.yang@linux.dev wrote:
> >   
> >> From: Wen Yang <wen.yang@linux.dev>
> >>
> >> struct ctl_table has long relied on extra1 and extra2 pointers to serve
> >> multiple unrelated duties, including range limits and caller-specific
> >> context.  This series addresses both:
> >>
> >> 1. Replace bound pointers with plain unsigned long min and max fields
> >>     directly in struct ctl_table.
> >>
> >> 2. Replace per-entry context pointers with a core stride mechanism,
> >>     allowing callers to register arrays of structures embedding struct
> >>     ctl_table and recover enclosing context via standard container_of().
> >>
> >> This RFC focuses on the core stride infrastructure and two representative
> >> complex users (netfilter nf_log and IPv4 devinet), as suggested by Joel
> >> Granados.  The remaining treewide callers are converted in a single
> >> squashed commit to ensure the tree builds and tests pass cleanly.  
> > 
> > I think I would have tried to avoid the indentation changes - just to
> > make the actual changes easier to see.
> >   
> 
> Good point.  Looking closer at Patch 4, keeping the original
> 'static struct devinet_sysctl_table { ... } devinet_sysctl' layout not
> only avoids re-indenting the 33 DEVINET_SYSCTL_* entries (cutting the
> diff from +104/-86 down to +41/-23), it also fixes a bug where
> kmemdup(&devinet_sysctl, ...) was copying a bare array into a
> struct devinet_sysctl_table that starts with sysctl_header.
> 
> With the original layout preserved, the table definition change is just:
> 
>      static struct devinet_sysctl_table {
>              struct ctl_table_header *sysctl_header;
>     -        struct ctl_table devinet_vars[IPV4_DEVCONF_MAX];
>     +        struct devinet_sysctl_entry devinet_vars[IPV4_DEVCONF_MAX];
>      } devinet_sysctl = {
>              .devinet_vars = {
>                      DEVINET_SYSCTL_COMPLEX_ENTRY(FORWARDING,
> ...
> 
> > ...  
> >> 4. Baseline rebase & conflict resolution:
> >>     - Rebased onto next-20261111 (aaa2f954c21b).
> >>     - Added proc_dointvec_jiffies_minmax and proc_dointvec_ms_jiffies_minmax
> >>       to sysctl_check_table().  
> > 
> > I didn't spot those in here, but are they even needed?
> > Without the bounds don't the minmax variants behave like the original functions?
> > So it was only necessary to add support for bounds to the existing functions.
> > (The only think that half makes sense is if a caller uses extra1/2 for
> > something else.)
> >   
> 
> Sorry for the confusion: I omitted the squashed treewide patch (6/6) 
> from the v2 posting to keep the mailing list traffic small, and that 
> bullet in the cover letter referred to a change in that patch.
> I have moved the sysctl_check_table() addition into Patch 1 for v3.
> 
> proc_dointvec_ms_jiffies_minmax() was already in the tree, and
> proc_dointvec_jiffies_minmax() was recently added in linux-next by 
> commit 75f5722df2b4 ("net: restrict message_cost and message_burst to
> non-negative values").  You are right about the historical reason: the
> separate *_minmax handlers only existed because callers of 
> proc_dointvec() and friends could stash unrelated context in 
> extra1/extra2.  Once extra1/extra2 are gone and bounds live in dedicated 
> min/max fields, merging the *_minmax variants into the base handlers 
> will be a clean follow-up.

You can probably also delete the 'vec' part of the names while doing
the global change.
A lot of the cases actually error any attempt to supply a vector.
I found an old commit saying there were only a handful of cases,
and most of those were strings.
So the (IIRC) maxlen field can't be deleted (yet), or repurposed to avoid
the need for separate u8/u16/u32/u64 functions.

> 
> > Related, I think you can reduce the size of the final patch and the likely hood
> > of some silly errors by making the 'dointvec' functions treat min == 0, max == 0
> > (ie no initialisers) as 'no limit' rather than 'only zero allowed'.
> >   
> 
> There are two reasons why treating (min == 0 && max == 0) as "no limit"
> in the *_minmax handlers turns out to be problematic:
> 
> 1. It conflicts with dropping redundant '.min = 0' on signed handlers,
>     and does not help non-zero lower bounds:
> 
>    - Most proc_dointvec_minmax() callers in the tree only set
>      '.extra1 = SYSCTL_ZERO' (with .extra2 = NULL) to reject negative
>      inputs, i.e. [0, INT_MAX].  Once we drop the redundant '.min = 0'
>      initialiser, omitting '.max = INT_MAX' as well leaves the entry at
>      (min == 0, max == 0).  If proc_dointvec_minmax() treats (0, 0) as
>      "no limit" ([INT_MIN, INT_MAX]), all of those non-negative entries
>      silently accept negative values again.

That is the one I missed.


>    - For entries with a positive lower bound and no upper bound (e.g.
>      '.extra1 = SYSCTL_ONE, .extra2 = NULL' -> '.min = 1'), min is non-zero,
>      so a (min == 0 && max == 0) check does not trigger anyway; omitting
>      .max leaves max == 0 < min and rejects all writes.

That empty range could easily be handled.

> 
> 2. Implicitly defaulting an omitted .max to the type limit is fail-open
>     on handlers whose whole purpose is range checking:
>     Under the old "extra2 == NULL means no upper bound" rule, several
>     *_minmax entries in net-next had bugs fixed just in the past two weeks
>     because .extra2 was left unset:
> 
>    - 850a7225bc61 ("tcp: limit tcp_tso_rtt_log to a valid shift count"):
>      tcp_tso_rtt_log used proc_dou8vec_minmax with neither .extra1 nor
>      .extra2 set (so both defaulted to NULL -> [0, 255]), allowing shift
>      counts >= 32 and triggering UBSAN shift-out-of-bounds in
>      tcp_tso_autosize().
> 
>    - 0bc7b5b2985f ("ipv4: restrict igmp_qrv to 255") and
>      6d6bdc1b943c ("ipv6: restrict mld_qrv to 255"):
>      both entries used proc_dointvec_minmax with '.extra1 = SYSCTL_ONE'
>      and left .extra2 unset (NULL -> INT_MAX); writing 256 silently
>      wrapped the backing u8 field to 0 and triggered
>      WARN_ON(idev->mc_qrv == 0) in mld_query_work().
> 
>    With an explicit [min, max] closed interval, .min defaults to 0
>    (matching non-negative inputs), while forgetting .max on a *_minmax
>    entry leaves .max = 0 (fail-closed, immediately rejecting non-zero
>    writes during testing) rather than silently allowing up to INT_MAX.
> 
> To eliminate the risk of hand-written mistakes when converting existing
> one-sided entries, I will updat the coccinelle script (Patch 5) in v3 so 
> that whenever an entry uses a *_minmax handler with only a lower bound 
> (.extra2 absent), the script automatically supplies the matching type 
> maximum (INT_MAX/UINT_MAX/ULONG_MAX/U8_MAX) according to .proc_handler.

In some sense that hides the fact that possibly no one had thought
about a sane upper bound.
(The same is actually true if there is no lower bound, even zero may
not actually be a sane value in many cases.)
Possibly you need a different identifier for the implicit bounds rather
than any explicit bounds that someone has actually set.
So you might use [DEFAULT_ZERO .. DEFAULT_UINT_MAX] to differentiate from
an explicit [0 .. UINT_MAX] that you might hope someone that thought about.

I think I'd definitely do that if removing the 'minmax' functions and
just supplying a non-restrictive range.

Perhaps you should add a sample file updated by the script?
All of them is definitely OTT.

David 


> 
> 
> Thanks,
> Wen
> 

