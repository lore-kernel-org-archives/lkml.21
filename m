Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029406;
	b=z8mERGJrHT9L2BxGNNny8rpyieyTh1N4IdX/KdNTGxGizF32VeLb76WnTgJjbt5sHsXE
	 LW5YNqxXwdWep2I6i9YUZASyI94TtBbYBaVGbigijpiiL5aY55c/fgke5gDl/hjsNdBeK
	 u82NbouYDQd/B+ehl3xTSbxQ/BSRLM4BWkazfn1xYvyFq5qc+szl0Y9YZawBf5JTDBb7J
	 WQuJPwYOO/cfmuZI9HpXmsLv9IvVrhvsM3cLEM6yPKcJ8I4FM7CarzIRoUiNGgPxVUFbW
	 lwuxGNehVuxr9rNeW72ANIF9MWOLqbslmF6kkyaKShwFAmbWMAgNRCEvJDdGoKRzBIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wesoUpV5LSWdODsu/SFZafU9p7VW5qMB6GV5WAXmCps=;
	b=Vmx79f/PyCE676W14iuNWYhHxsnLR8Bm5za1t65WGLIcGK99+G4uhi9Xr5WSNmT3sgXk
	 +RPLQTVMsRIek9kkWu0BjB4NemLRNZCpg2UCp77JP7Cc+SxLFApPuv57vGnGT7PK+WPC4
	 JC2vJlw2E4l5dcR6V8HvUfV9BNJztB+OniCOuQM3XZUQw8BTu+C7yxC5CSpCjme9gOTVh
	 2lSCgEcQxz7mN2DWNo5GqIW0w4ZLlZFr3u7q9QXw4lylyI45xtjvo64Jfo+s+KoHiv14b
	 B3h/q1SulNKx1mWoSGZWQk1GajTs8oy7myTbX0xmnycuxGSQcRSknjJZdm4nMHaWc8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EnOmo1Hu;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70FC606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D70FC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EnOmo1Hu
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so220146266b.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029404; x=1795634204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wesoUpV5LSWdODsu/SFZafU9p7VW5qMB6GV5WAXmCps=;
        b=EnOmo1HuUvc7EGsYlRfl9nhRrKFGNntbj5vInyr6QYmFyneb/tBxWAkVAGBch/f+aJ
         lNZ15uXiGgqXMUzMS6Q4w4PMOjBsXkRMFRteY5mOwF3XPgDSou3XRG4x9NsrvG5g20aW
         LJQnWSkulmBqHw7owhF3IPwByiovlskFc4hSOSjKgp5YCLLCZLp+fs0/Dx0/N5/Wy9PK
         n7IEH+cw6zwKFDUMGXI7NI/nF1OvzjNAUIB9Fd/TcA00xwCkfTrL/GeADbVtP2ahutK0
         YNeBgFJAhtU7KfwE0BxGZwBRWNUvC0pW1bif8gAf/cqi0YtWJww0L/SinlAqypzPkWmf
         pRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029404; x=1795634204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wesoUpV5LSWdODsu/SFZafU9p7VW5qMB6GV5WAXmCps=;
        b=05LA4g/S4lFDtFyIjlW8MGI+OVQBKj80bYM8cFX6g2JbexzkgpeMfc2SGY/wK3fRVW
         OEc7taAot/HeLVdBgeBzsAAk+5qosA44n0j3SRw2Yb/jYXnjETuLZtmVHq+aRmFAp9Mw
         Hcj5KAdtZNQnieyxv4703AZPamttMNo+h6gFRp1pXG1xzUonx3U4vbYEdmaCGKPdPZCS
         UHZXTPzAjT8/8eYYMEphPZ3oS7OF8EARNWfRDIuqZk5t4NhaILHkktVAJQU9SFYwP0lA
         DHQkqe34a83DTCWASepf/A+u6I94pBGVquHnOX54H1qp+sbzzYObKuRdEY5xm8I4c91s
         h2eQ==
X-Forwarded-Encrypted: i=1; AL+hErFTzq1daELFA/FHfVJ5gIYeDE3ch+Gxm9JX90hhN7i33mawu0AT8bNcxd/iLUW60XnaLdDPPmzaCwL5vnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qc6+3r6jvMf1nabcg4RfOpE5tVyYmrEg2OyAgH4Kt6I1HbDk3
	IFNj4/0dfgWIu1S7sLK4OCmZGss67IDyaT9AzP8upEnzAs3sUttaEFSu
X-Gm-Gg: AYBFou1lezlNQOXppGHYhUODx4U7tyi/4eIpOEYtsudngMpkcmgNOzFkL4R2yDmmJp9
	G0Pd45//1VR1jaaxCRH+ccypDsmUqY6e7kJRQMhwk6oMExemJmze0kCXqn/BffubK4tklPjRy01
	yyqONf2lPGFz7SNSBuq/LQtNSamlN41dCH122ZzTHVb6RShEhPSlKujg5NUHcl+XIyPuXh0RyE3
	xnAHxgYfUwV4d0HzNpcli2uVRnV+WVDfVBahORr4z6vPOPlMLHMcYjTeOYttLjnluHhKiX6+IQq
	6ti8tJaMYt9+sz6vN2uqJdpMo6sZGSsPoSpOQOg0M+AKq7SHrONIgGmygRJsceSuOOdxH5VqAG+
	mxr0lHlv4t+tw7qgZi7g+hROaT0eEn5C6DN8x/o1AxfmNg+CffA6uo9YCCM6SsxuZSZOMy4EK1P
	SPnF68SycX6l+B0Dx8vtehp+mptbg4HiP8zzmVxiAMCRYMmyDYC/pzDZwlcOG64a7Pk+vX5kU9X
	DpEC7m0+LQvKIw/dQ163C1QprYCi333TD6KbsdsRRe/JjnCPQiCjfg6UcFfSBDtkGCzxA==
X-Received: by 2002:a17:907:3e9b:b0:c50:5186:a428 with SMTP id a640c23a62f3a-c510e2d83ecmr343950166b.27.1795029404223;
        Wed, 18 Nov 2026 11:16:44 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4cf4sm30980066b.29.2026.11.18.11.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:16:43 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 18 Nov 2026 20:16:40 +0100
To: Dev Jain <dev.jain@arm.com>
Cc: Hao Ge <hao.ge@linux.dev>, Suren Baghdasaryan <surenb@google.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v5 04/11] mm/vmalloc: reject an unaligned range in
 __vunmap_range_noflush()
Message-ID: <av35mNq7RrxN56Tp@milan>
References: <20261116071325.263682-1-hao.ge@linux.dev>
 <20261116071325.263682-5-hao.ge@linux.dev>
 <4c233641-15ad-4e5a-a106-423bc31f357c@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c233641-15ad-4e5a-a106-423bc31f357c@arm.com>

On Tue, Nov 17, 2026 at 11:35:24AM +0530, Dev Jain wrote:
> 
> 
> On 16/11/26 12:43 pm, Hao Ge wrote:
> > The PTE loop stops only at addr == end. An unaligned end is never
> > reached, so the loop keeps clearing past the range. An unaligned
> > start clears the page below the range first. Both are caller bugs,
> > and the damage is hard to attribute afterwards.
> > 
> > vmap only installs page aligned mappings, so an unaligned unmap
> > request is never a legitimate teardown. Warn and bail out at the
> > entry of __vunmap_range_noflush(), before any PTE is cleared.
> > 
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/all/sashiko-outbox-178439@kernel.org/
> > Signed-off-by: Hao Ge <hao.ge@linux.dev>
> > ---
> >  mm/vmalloc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index a168f6f20f4f..e2b63cb1592b 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -523,6 +523,9 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end,
> >  	pgtbl_mod_mask mask = 0;
> >  
> >  	BUG_ON(addr >= end);
> 
> Nit: It is usually a practice to change the existing BUG_ON's to
> WARN_ON's too, if you are changing around that part.
> 
> 
> > +	if (WARN_ON_ONCE(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end)))
> > +		return;
> 
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> 
Agree, please also replace BUG_ON() and feel free to add:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
