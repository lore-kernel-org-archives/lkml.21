Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120961;
	b=GgMyZsQjma5R0seNzb3QmX3vA/S3BdWWBJ5pTT22XvXNfSf7lqIzsFfe7J0sT0DZOLFc
	 wUgZsDlZWIG8B02TT8V3LTVd1CASp8I4ehST84dfLLlxyjWMOVh8VJEMr4t6W5lnBDIb+
	 7bJ6gGm1DoGzcg++B1xhrHAby49Ej0zWhLrxjyXT+4Ot4r3Vg+lobBo8/tOEe1tXO0v0Y
	 DOv6/D+divznrmHEnbSHK+h+J7xhaXEHesCgdDPRDZWelDKNktQkQSlG85LAQU+P6XH2q
	 /ei+NXcAOGzJBvOcs2KbG/g+LsSAPqWVsmkuXY2RdFpKH3+NG3MI9ksFEiS5YDoPLhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZBFQR7u8Ee3YVRPu1eQVodXE/UpYLg54xCAcuhe+MAs=;
	b=taWcxxnlHqPfBPMIQbi4BRK7G+qG3ewwds6rnJd+2kOgTWWxmjhUDodQ21ykehl7dkaI
	 2EdYluFQpV73P7ryVkNrL8oIHvQBMt+eLV7AXjnAKHKyaa9fMXpHYQf5gMoQmwLr3QZkR
	 4jtmFocb2GlK1tNGUA0V8geMaFf3p++DE6EIX00TR4EGqTg/bGtsmov4GizRDku0IO7hF
	 d3PaheYeRwy4vHFlICP1owYR4N/CvbLz+T5xZ9vJZcgJMAZYGqymq8/LWxoGvPu0ZmjXy
	 TjXceNUISImz2tUjpfQg31iP2Dkjc1CpCYmNA1koX3tMeNOZUeGhIJ5sqzYaqOgaNCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aE6sIri7;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DD7606B76A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DD7606B76A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aE6sIri7
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38587f3de36so131642eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795120960; x=1795725760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZBFQR7u8Ee3YVRPu1eQVodXE/UpYLg54xCAcuhe+MAs=;
        b=aE6sIri7PZ2O/cNz8ffteNa/iaPenFBW/4KsA6dbejNcO+T5cplXyqluJA/UZyEdKQ
         uAkOTsVvXXiONT6yGDBljiQ097E+0/MtfqurKtc90inEuaW91wBbUDoH3uIzpq8dxtbq
         Ke8dLeSmK4bYjr9qi3qC3UEDOmFHj+0tkequohf5G8AJ/n0Ns5WNvbz9Hpep7o3i96Gq
         g9NhXhSkM/+BuW1uTcLttyOjlwf8mghs9w4tyu+YbPSTzDk0q1mudOA3Xn+4HXgjJ4dZ
         kkyfPmcy4Ny90JknpXSza1CDqOKVpzsYFR9TuyVerWoRMYRIo4zVOfDJU9IJz+2bnV1B
         NtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795120960; x=1795725760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBFQR7u8Ee3YVRPu1eQVodXE/UpYLg54xCAcuhe+MAs=;
        b=rrhhPYjR7BiooYUVlHXZjnNoIJESh3rqtLCAH0MzqSgmqzRYQHkcgzF1xNyIJsxael
         +3ngQFbzEidhohHup7Eia93yGqlEGzB3n2h1Owt5vMmKBKj4bTZ2/sybPMnwG8FRhDgv
         3yR28hOTRRsruetWtfj4XpYtplkomftJgGcaoLTCeHFJkX7EwIW1XA8pIquOdxNlYhHP
         64apuzcs3uuJHyEMs8VLW7TzxwX4m8hlVzIK8Y7pL4cjLYRiOHAwXNOzmrFvkIiWOpC4
         gpGHkmo9IKqTVdkxGP/8uNFr55XioYqgjy5oBDodixnwI/E75Han0YxLD7tyDtFcve5f
         2kFg==
X-Forwarded-Encrypted: i=1; AL+hErHFo2aMFOtbj/ca+djDzqBSeAECdHne85u4FDO8461986sR1lO43UyKUnshhlCBKFR6LSMLXrQ4rAwyKMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y48kuAgXxXcTKN1BkLJEIcf2t8jTR+568tQucG7gVFv8jZ3FJ
	YY9SLGCK6gO4woy9LFmWtnbX9v6f/+6navY2T3k7oEtYeBnqb5gBIfBA
X-Gm-Gg: AZFdTZff1d/TKQCZmYqQBWvxKnNKvZrMuGDbTN0gfwXo5DWS5Sesiex2G+xtb8mjapR
	rHWrqagyKSTpEVSJYxKW1SCtshAjtJzWV4QFWUQxPh5jMK6FMPI695yVsKmUmMyzWIO/I/3wzak
	1BNp0JJnZhaazMvevW+xXO5I8fAmew0xtjXM7dgVIROFX4RJXkRYiywhGSDf1iM63komX7+1bTv
	aWH5x4FLlVYPFUgpfYiDfQ5k/XX5z+M5bGR0CywC2ApISYAUd7cQS7mHjBWPBBF3sSe6oR+g9xx
	D9+WkuZQsI2P9NXI4wxHylj720lBozs6ED1/PxTfLXRcl8PhGYBYC3Td9nccLweGr2sK/JQFLWy
	u5xJdZmc5dEZRq9PgdL/ZYwAgxAS9hMctZb+jurt+kTU23RcW02ty1fSSK5Bzjw6T7oTwkRmiNR
	wGjz5A12+2+Sa+Q77CtSegYqQMY89uwdGPpagoALBzNlLbrRWqGo2Mp2mrek7Y8zUG5p/iKe2gn
	KBlrhVmDV7Xn2+BmSMDa8xbOMbeZqENybEF3cBDuOF4cVVm7SXdgN2WYKclxu1gAsYcDbWiUdZl
	2WD/AFBflH1WNFFZNlwYjlYEY7JS0d/cUQ==
X-Received: by 2002:a05:7301:4306:b0:351:29c8:643 with SMTP id 5a478bee46e88-3856f65cb16mr430705eec.18.1795120959979;
        Thu, 19 Nov 2026 12:42:39 -0800 (PST)
Received: from localhost ([115.96.176.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm1079684eec.21.2026.11.19.12.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:42:39 -0800 (PST)
Date: Fri, 20 Nov 2026 02:12:36 +0530
From: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Breno Leitao <leitao@debian.org>, Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>, Richard Cheng <icheng@nvidia.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Kiryl Shutsemau <kas@kernel.org>, Harry Yoo <harry@kernel.org>
Subject: Re: [RFC PATCH 5/5] cxl/region: Register device poison before
 exposing RAM
Message-ID: <av9fPGZHfa8yOnq7@acer-nitro-anv15-41>
References: <20261010162017.62506-1-shaikhkamal2012@gmail.com>
 <20261010162017.62506-6-shaikhkamal2012@gmail.com>
 <20261016233532.51766fc4@jic23-hlaptop>
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
Content-Disposition: inline
In-Reply-To: <20261016233532.51766fc4@jic23-hlaptop>

On Fri, Oct 16, 2026 at 11:35:32PM +0100, Jonathan Cameron wrote:
> On Sat, 10 Oct 2026 21:50:13 +0530
> Shaikh Kamaluddin <shaikhkamal2012@gmail.com> wrote:
> 
> > The trigger_poison_list interface may retrieve poison after CXL memory
> > is already online, which is too late to prevent known-bad frames from
> > entering the page allocator.
> > 
> > During RAM-region probe, retrieve a poison-list snapshot for each
> > participating endpoint decoder. Validate each record against the
> > decoder's assigned DPA range, translate its poisoned DPA units to HPA
> > and PFN, and collect the affected PFNs in an xarray. Coalesce consecutive
> > PFNs and register the resulting ranges with the pre-online hwpoison
> > registry before creating the DAX region.
> > 
> > When Get Poison List is supported, abort region probe if the list is
> > incomplete, malformed, or cannot be translated. If volatile poison-list
> > retrieval is unsupported, preserve the existing behavior and warn that
> > poison cannot be withheld before memory onlining.
> > 
> > Signed-off-by: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
> A few comments inline.  I wouldn't rush to revise this though as I think
> the whole concept needs more input from others.
> 

Hi Jonathan,

Agreed. There are open comments on the mm side too (3/5 and 4/5), so I
will get the design settled before sending v2.


> Jonathan
> 
> > ---
> >  drivers/cxl/core/region.c | 322 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 322 insertions(+)
> > 
> > diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
> > index c72524923b38..e3ffa77927df 100644
> > --- a/drivers/cxl/core/region.c
> > +++ b/drivers/cxl/core/region.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/string_choices.h>
> >  #include <cxlmem.h>
> >  #include <cxl.h>
> > +#include <linux/memory-failure.h>
> >  #include "core.h"
> >  #include "mce.h"
> >  
> > @@ -3038,6 +3039,323 @@ int cxl_get_poison_by_endpoint(struct cxl_port *port)
> >  	return rc;
> >  }
> >  
> > +/*
> > + * Device-reported poison is gathered at RAM-region probe, before the range
> > + * reaches dax/kmem, and registered with the pre-online registry so the
> > + * frames it covers are withheld when the memory is onlined.
> > + */
> > +static int cxl_poison_store_pfn(struct xarray *pfns, u64 hpa)
> > +{
> > +	return xa_err(xa_store(pfns, PHYS_PFN(hpa), xa_mk_value(1),
> > +			GFP_KERNEL));
> 
> Fix alignment of the line above. Right now it isn't visually clear
> which function call the parameter is for.
>

Will fix.

> > +}
> 
> > +static int cxl_poison_record_to_pfns(struct cxl_region *cxlr,
> > +				     struct cxl_memdev *cxlmd,
> > +				     const struct cxl_poison_record *record,
> > +				     struct xarray *pfns)
> > +{
> > +	struct cxl_region_params *p = &cxlr->params;
> > +	u64 raw = le64_to_cpu(record->address);
> > +	u64 units = le32_to_cpu(record->length);
> > +	u64 dpa = raw & CXL_POISON_START_MASK;
> > +	u8 source = raw & CXL_POISON_SOURCE_MASK;
> > +	u64 length, end, step, cur;
> > +
> > +	if (!units ||
> > +	    check_mul_overflow(units, (u64)CXL_POISON_LEN_MULT, &length) ||
> > +	    check_add_overflow(dpa, length, &end))
> > +		return -EPROTO;
> > +
> > +	/*
> > +	 * A corrected error never reaches the poison list, so every record
> > +	 * is uncorrectable. Only a failure of the device's own media is
> > +	 * withheld: External poison was written by the host into healthy
> > +	 * media and a rewrite or Clear Poison recovers it, and Injected
> > +	 * poison is a test artifact. Withholding either would make a
> > +	 * recoverable state permanent.
> 
> This reflects back to the comment I made in the cover letter.
> Device discovered poison can be ephemeral. 

Agreed. If the error was only temporary, the next write would fix it.
But nothing ever writes a withheld frame, so it stays on the list and
we keep withholding it forever.

>I'm also not sure for volatile
> where any poison record would come from if you are doing this for newly 
> powered up devices - they might scan whilst initializing but might not as
> that is very very slow to do.  Typically poison is found much later by
> patrol scrub (or synchronous read).

A real media fault is still there after a power cycle, which is why
PPR exists, at boot or at runtime. But on a volatile device the poison
list may not remember it: until patrol scrub or a read finds it again,
the list can be empty. So this mainly helps when the device stays
powered while the host restarts, like kexec or a driver re-bind, or
with a device that keeps its error records across a power cycle.

>This may be more interesting for
> persistent memory where the persistence is used, but you aren't addressing
> that as far as I can tell.
>

Agreed, that is the stronger case. Today the CXL driver doesn't feed
the poison list into the nvdimm bad ranges at all, so pmem and devdax
on CXL don't see known-bad locations either. cxl_pmem_ctl() also
returns -ENOTTY for ND_CMD_CLEAR_ERROR, so a bad block couldn't be
cleared by a write even if it were listed.

I will  look at both as a separate series: bad ranges from the poison
list at pmem region probe, plus clear-error support. kmem could then
use the same list when a pmem range becomes system RAM.

> > +	 */
> > +	if (source != CXL_POISON_SOURCE_INTERNAL) {
> > +		dev_dbg(&cxlr->dev, "%s: dpa %#llx source %u not withheld\n",
> > +			dev_name(&cxlmd->dev), dpa, source);
> > +		return 0;
> > +	}
> > +
> > +	/*
> > +	 * Translate once per unit of HPA contiguity rather than per 64
> > +	 * bytes. Consecutive DPAs within an interleave granule map to
> > +	 * consecutive HPAs, and a granule no larger than a page lies within
> > +	 * one page, so stepping by min(granule, PAGE_SIZE) from an aligned
> > +	 * start reaches every page the record covers.
> > +	 */
> > +	step = clamp_t(u64, p->interleave_granularity, CXL_POISON_LEN_MULT,
> > +		       PAGE_SIZE);
> > +
> > +	for (cur = ALIGN_DOWN(dpa, step); cur < end; cur += step) {
> > +		u64 hpa = cxl_dpa_to_hpa(cxlr, cxlmd, max(cur, dpa));
> > +		int rc;
> > +
> > +		/* Not mapped by this region; nothing here to withhold. */
> > +		if (hpa == ULLONG_MAX)
> > +			continue;
> > +
> > +		rc = cxl_poison_store_hpa(cxlr, pfns, hpa);
> > +		if (rc)
> > +			return rc;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int cxl_region_collect_decoder_poison(struct cxl_region *cxlr,
> > +					     struct cxl_endpoint_decoder *cxled,
> > +					     struct xarray *pfns)
> > +{
> > +	struct cxl_memdev *cxlmd = cxled_to_memdev(cxled);
> > +	struct cxl_poison_snapshot snapshot;
> > +	int rc;
> > +
> > +	rc = cxl_poison_snapshot_init(cxlmd, &snapshot);
> > +	if (rc == -EOPNOTSUPP) {
> > +		dev_info(&cxlr->dev,
> > +			 "%s: no Get Poison List support, nothing withheld\n",
> > +			 dev_name(&cxlmd->dev));
> > +		return 0;
> > +	}
> > +	if (rc)
> > +		return rc;
> > +
> > +	rc = cxl_get_poison_by_decoder(cxled, &snapshot,
> > +				       CXL_POISON_QUERY_PREONLINE);
> > +	if (rc == -EFAULT) {
> > +		/*
> > +		 * The device keeps no poison list for volatile ranges, which
> > +		 * CXL r3.2 8.2.9.8.4.1 permits. Online the region as today.
> 
> Use latest available spec for references (they don't make old ones easy
> to download!)
> 

Will update the latest references.

> > +		 */
> > +		dev_info(&cxlr->dev,
> > +			 "%s: no volatile poison list, nothing withheld\n",
> > +			 dev_name(&cxlmd->dev));
> too noisy.
>

Will drop it.

> > +		rc = 0;
> > +		goto out;
> > +	}
> > +	if (rc)
> > +		goto out;
> > +
> > +	/*
> > +	 * Withholding from a partial list would online the region on the
> > +	 * belief that every bad frame had been named.
> > +	 */
> > +	if (snapshot.truncated ||
> > +	    (snapshot.device_flags & CXL_POISON_FLAG_OVERFLOW)) {
> > +		dev_err(&cxlr->dev, "%s: poison list incomplete\n",
> > +			dev_name(&cxlmd->dev));
> > +		rc = -EOVERFLOW;
> > +		goto out;
> > +	}
> > +	if (snapshot.device_flags & CXL_POISON_FLAG_SCANNING) {
> 
> That one seems wrong. We don't prevent memory from coming online because
> there might be poison to be found.

Agreed, I will drop that check. Anything the scan finds later is handled
like any other poison found at runtime.

> 
> > +		dev_err(&cxlr->dev, "%s: media scan in progress\n",
> > +			dev_name(&cxlmd->dev));
> > +		rc = -EBUSY;
> > +		goto out;
> > +	}
> > +
> > +	for (u32 i = 0; i < snapshot.nr_records; i++) {
> > +		rc = cxl_poison_record_to_pfns(cxlr, cxlmd,
> > +					       &snapshot.records[i], pfns);
> > +		if (rc)
> > +			break;
> > +	}
> > +out:
> > +	cxl_poison_snapshot_destroy(&snapshot);
> > +	return rc;
> > +}
> > +
> > +static unsigned int cxl_count_poison_ranges(struct xarray *pfns)
> > +{
> > +	unsigned long index, previous = 0;
> > +	unsigned int nr = 0;
> > +	void *entry;
> > +	bool first = true;
> > +
> > +	xa_for_each(pfns, index, entry) {
> > +		if (first || index != previous + 1)
> > +			nr++;
> > +		first = false;
> > +		previous = index;
> > +	}
> > +	return nr;
> > +}
> > +
> > +/*
> > + * The xarray holds each PFN once and xa_for_each() walks them in ascending
> > + * order, so runs of consecutive indices are exactly the sorted,
> > + * nonoverlapping ranges preonline_hwpoison_register() requires.
> > + */
> > +static int cxl_pfns_to_ranges(struct xarray *pfns,
> > +			      struct preonline_hwpoison_range **ranges_out,
> > +			      unsigned int *nr_ranges_out)
> > +{
> > +	struct preonline_hwpoison_range *ranges;
> > +	unsigned long index, previous = 0, run_start = 0;
> > +	unsigned int nr_ranges, nr = 0;
> > +	void *entry;
> > +	bool first = true;
> > +
> > +	nr_ranges = cxl_count_poison_ranges(pfns);
> > +	if (!nr_ranges) {
> > +		*ranges_out = NULL;
> > +		*nr_ranges_out = 0;
> > +		return 0;
> > +	}
> > +
> > +	ranges = kvmalloc_array(nr_ranges, sizeof(*ranges), GFP_KERNEL);
> 
> kvmalloc_objs()
> 

Will switch.

Thanks,
Shaikh Kamal

> > +	if (!ranges)
> > +		return -ENOMEM;
> > +
> > +	xa_for_each(pfns, index, entry) {
> > +		if (first) {
> > +			run_start = index;
> > +			previous = index;
> > +			first = false;
> > +			continue;
> > +		}
> > +		if (index == previous + 1) {
> > +			previous = index;
> > +			continue;
> > +		}
> > +		ranges[nr++] = (struct preonline_hwpoison_range) {
> > +			.start_pfn = run_start,
> > +			.nr_pages = previous - run_start + 1,
> > +		};
> > +		run_start = index;
> > +		previous = index;
> > +	}
> > +	ranges[nr++] = (struct preonline_hwpoison_range){
> > +		.start_pfn = run_start,
> > +		.nr_pages = previous - run_start + 1,
> > +	};
> > +
> > +	WARN_ON_ONCE(nr != nr_ranges);
> > +	*ranges_out = ranges;
> > +	*nr_ranges_out = nr;
> > +	return 0;
> > +}
> > +
> > +static void cxl_unregister_device_poison(void *data)
> > +{
> > +	preonline_hwpoison_unregister(data);
> > +}
> > +
> > +static int cxl_region_register_device_poison(struct cxl_region *cxlr)
> > +{
> > +	struct cxl_region_params *p = &cxlr->params;
> > +	struct preonline_hwpoison_range *ranges = NULL;
> > +	struct preonline_hwpoison *handle;
> > +	unsigned int nr_ranges = 0;
> > +	unsigned long nr_frames = 0;
> > +	struct xarray pfns;
> > +	int rc = 0;
> > +
> > +	lockdep_assert_held(&cxl_rwsem.region);
> > +	lockdep_assert_held(&cxl_rwsem.dpa);
> > +
> > +	/* The region may have been decommitted while the lock was dropped. */
> > +	if (p->state < CXL_CONFIG_COMMIT)
> > +		return -ENXIO;
> > +
> > +	if (test_bit(CXL_REGION_F_NORMALIZED_ADDRESSING, &cxlr->flags)) {
> > +		dev_info(&cxlr->dev,
> > +			 "normalized addressing, poison not translated\n");
> > +		return 0;
> > +	}
> > +
> > +	xa_init(&pfns);
> > +
> > +	for (int i = 0; i < p->nr_targets; i++) {
> > +		struct cxl_endpoint_decoder *cxled = p->targets[i];
> > +
> > +		if (!cxled->dpa_res || !resource_size(cxled->dpa_res))
> > +			continue;
> > +		rc = cxl_region_collect_decoder_poison(cxlr, cxled, &pfns);
> > +		if (rc)
> > +			goto out;
> > +	}
> > +
> > +	if (xa_empty(&pfns))
> > +		goto out;
> > +
> > +	rc = cxl_pfns_to_ranges(&pfns, &ranges, &nr_ranges);
> > +	if (rc)
> > +		goto out;
> > +
> > +	rc = preonline_hwpoison_register(ranges, nr_ranges, &handle);
> > +	if (rc == -EOPNOTSUPP) {
> > +		/* No poison tracking in this kernel; nothing to withhold. */
> > +		rc = 0;
> > +		goto out;
> > +	}
> > +	if (rc)
> > +		goto out;
> > +
> > +	for (unsigned int i = 0; i < nr_ranges; i++)
> > +		nr_frames += ranges[i].nr_pages;
> > +	dev_warn(&cxlr->dev,
> > +		 "withholding %lu frame(s) reported poisoned by the device\n",
> > +		 nr_frames);
> > +
> > +	rc = devm_add_action_or_reset(&cxlr->dev, cxl_unregister_device_poison,
> > +				      handle);
> > +out:
> > +	kvfree(ranges);
> > +	xa_destroy(&pfns);
> > +	return rc;
> > +}
> 
> 
