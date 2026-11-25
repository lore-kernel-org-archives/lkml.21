Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599943;
	b=CKOPxQVayoVs/MqbjlUbhmClrRjzrzoIZabUpi08200tdRgU9DowMNZLrVp51HUSY8ad
	 kTqLTKoRWVjVNbjC8ZfKMkW0DUT71a63VR+GDBlfA1NnIHVefeKz7ZPdNPN6KzIqN8i4q
	 YwzMmfGGqOFM9efv74jas2/JZn5Crx2Cix37JNi/vFg6YkWi/F2e+LnHeoFOMgy3Mg7lE
	 9bNSx+gHonY5qv2+qYrVw0Q2eflHGdLr94lkkTKTIpVSTsRSnkkLaLTijgIoZ5rHPHTgu
	 LPSbiDfzdzUOilS/hLrPdq4hvZJWb9muU6RhB9hNOwC8DUWiT4TxEudcvElB8doPwcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599943;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:Subject:
	 From:Cc:To:Date:Message-ID:User-Agent;
	bh=5+CktZHSqkPxuSEXEAbNZNMCArY53vM9vteTf980DA4=;
	b=iEB8LO9hZts8Nz2soraInDpgGvUvS0H4n+WHzRs+32eGwTFKETx/KGWsp2dEjfL7Rtd6
	 p/asItZofFZOfFGVhEI2swahwQQ8GR9K3RZIm1/PdgYpL+2cvvkOAxptitxvYbRC1fgF+
	 DXqrkUMvSWwBcnTojDsAOsaCb0ygAcAVrmRgfQxnqIwq6OBfLbf7Pyb1BLNdr3lhONES3
	 /QImj223QAVdXsUPqqB2K8PEmkS4Fa24UyLUbPJxpT0o/Q5whk7mBqA1bAxPO1L2/RDGc
	 QO7Sdmc2/PpK+4kAEfiSSSZzOj1DhDou4YIH+qQduQ0NQvcUC5BK30KBc1yjYbHlq0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JTI4KPlb;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DF8606A336
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99DF8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JTI4KPlb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795599942; x=1827135942;
  h=mime-version:content-transfer-encoding:in-reply-to:
   references:subject:from:cc:to:date:message-id;
  bh=pAz9QCMK2g+sjrrKzBg/ayJIwQw8c7CEhoVNFJMFDkw=;
  b=JTI4KPlba7soE+DwXOc/+7JKPmZan6tCx49fnvZzEkQSXdR9y0Pq7piA
   /E6eFdygXA0iFHhXVBsxH1CIScI4ySAaF5s8oF1uG+TJESMwB43E3XDd7
   Xj66MT77aswxdt9MoTFOuQPBEbQ1UfQsDMrPE5EYbiJcJbywuTZdzUu01
   DS5j+ArVki5qdE/0Dr/wNQKKoxapLUL3js1aIL+GxUKSr7bz1l6xPFl+I
   QJf84LHX4CjBKDGXshKnEM2B42+WKJcu1BMuxifqtoIbw25jfRG7CRLHm
   48oDdcIdzHvHwzpQFO24IWQeOhDQ25e/7rMascwdcYC93MVkNomHA2/Iz
   A==;
X-CSE-ConnectionGUID: CydKFM22RS+/olaNo2dmWA==
X-CSE-MsgGUID: DEATviDLSIuVCLz6pUgMlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4551746"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4551746"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 01:38:25 -0800
X-CSE-ConnectionGUID: H4+BfhJURaC6hIFgX5ZViQ==
X-CSE-MsgGUID: 48vOVrHrSKCTSM1ql7iMCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="12252215"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.26])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 01:38:21 -0800
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <awZz6sq_4cjIgUcq@infradead.org>
References: <20261119134243.3745282-1-kas@kernel.org> <av8n42vx3Q7zvQK8@zenone.zhora.eu> <awBIB3vjr_o-gfCn@shutemov.name> <awZz6sq_4cjIgUcq@infradead.org>
Subject: Re: [PATCH] drm/i915/gem: Skip writeback of shmem folios with extra references
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andi Shyti <andi.shyti@linux.intel.com>, David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, willy@infradead.org
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, Christoph Hellwig <hch@infradead.org>, willy@infradead.org, brauner@kernel.org, torvalds@linux-foundation.org
Date: Wed, 25 Nov 2026 11:38:17 +0200
Message-ID: <179559949792.43928.13638993010156007645@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620

Quoting Christoph Hellwig (2026-11-25 07:36:42)
> On Fri, Nov 20, 2026 at 01:17:31PM +0000, Kiryl Shutsemau (Meta) wrote:
> > > >   while ((folio =3D writeback_iter(mapping, &wbc, folio, &error))) {
> > > > -         if (folio_mapped(folio))
> > > > +         if (folio_mapped(folio) ||
> > > > +             folio_ref_count(folio) !=3D 1 + folio_nr_pages(folio))
> > >=20
> > > I don't think we need this fix in the current tree. The i915
> > > writeback iterator already skips the shmem folio in the case you
> > > describe, so the new refcount check doesn't change the outcome.
> >=20
> > Oh. It took me a while to see why.
> >=20
> > __shmem_writeback() asks writeback_iter() for PAGECACHE_TAG_DIRTY
> > folios, and shmem never sets that tag, its ->dirty_folio is
> > noop_dirty_folio(). So the loop body never runs for any folio, and
> > hasn't since 776a853a43c9 ("i915: Use writeback_iter()").
>=20
> Heh.  I'm surprised no one noticed..

Not so funny to me, you folks are pushing regressions without ever
Cc'ing a single maintainer in the original patches.

I was under impression that Linux development had some rules about
not introducing regressions and also some rules about not pushing
stuff silently to other subsystems. Maybe it's just me not able to
keep up with the vibes of these times.

> > That makes me question the whole writeback thing. What's going on
> > there, and what's the plan?
>=20
> I (and others) have been asking forever to get drm out of micro-managing
> tmpfs.  I guess given that this code path hasn't worked for a year and
> a half is a pretty good indicator that this instance should simply
> go away.

That's not a good indicator in this case.

The writeback for dirty shmem pages took multiple years and multiple
iterations to address the best we could as it's not exactly a race
that shows up frequently.

It's also more likely on the hardware from the era the fix was developed
on, and the owners of those older machines are not exactly jumping to the
latest mainline but rather more likely to run Debian oldstable.

So which one of you will be writing up a revert or fix for the offending
patch or do you expect us to clean up the mess you've created?

Regards, Joonas
