Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795161400;
	b=oYDnA0KlDKPY2lKW1WQtidyCUwzBjPa73mNvuuXuGANFDxEQRP8Cs/GwsNna2pZkBmPu
	 hx2uF4NeLpE75DnZ6Ol39EwK4MVuhoj0hhXnPMzT+3LGhgJcKQ6CwAdRXqeIo5oPf13NF
	 yosJaGjO6iGMqcmHEOUn+wIo60uFllnKZM3EHqDfYvyn+LtjTKC6/G4xGzC+8QA4698yG
	 eR1W6ebcw2j6kOLHR+rK+2HAEibkI5ah4/mwYl0glsYEIaJAGsqqhrJIL7+GAqkwZshmI
	 RkG0aXE7Xjy+1tD8THk6rkqHnbFXiNLFMzCv62CNVfv83rUW8VsiT0KWBD/T0Y6s3LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161400;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Cc:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=pXCHGKA1G7cd/VId4mg2mOO5ekeYsaGiTDz18bBD4jE=;
	b=2lQYXo0oLZAUMrVg8TjcTLHxPcHdwTvnKoz1oU4medm+xTWGwRLRzWvvRDfOyCCbCxsj
	 Oo1Ke5b4O6HFGhODkUpgZ62/yDHpL+BqGsXs/nth8j7y2ZrNEp2ymiOMqT5ZrpFrDkIha
	 QeE496h3M6/L0JuKDqYoAmnwOqjtKP+ujmcNpSB16FbO4XEAAgjgwekgpcnWAvsBDape+
	 f34DmoUInsnhza3vPsgqWEixy1mgVj/qrFBZkJcNA1kmcxP1z2IlcxTDAj/0yy7Sz6w/1
	 qYGkQTe3g65qdD+TOmp7Hhz3bGZRofbXUEQTR5fjSUB1cfUq1K/cQXBUoL3apiyUSrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K5yIYbmY;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F96606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19F96606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K5yIYbmY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795161399; x=1826697399;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MdVnYq1kvVwJX6MP5qqwK4gVFp5jkS8xTQJjppXpv0k=;
  b=K5yIYbmY1wQPvjhtMCXExxzF4VJ5nQsPW00BNgsB2noYlb6nIQr1skND
   M886VeJNzwhKKth3PemKkDkyPRygIgy3vWvuCRG3l8wu2I3BWQUPwH5gf
   /yfOOWXK3yu/xe/WBco6i1JA03mF8XSfoDIwynlfSl4u54tvEkByto8Cj
   Rmb9gDvE3eCh8IRZtp1mGABdIEJrd7PAVKVUZej+148kUYxC2JHjk5XZ0
   9QMVgIGNMYmOTvFyb+ebHZ3PLjU04NhsT3flc5Z+Q6u79opWmkUEWiz6F
   WfvYH3JIakZuXSpOK/KrH0Q3vH8UnFRBrEL0dwIVcNHC2cpJvMA1Fg8tc
   w==;
X-CSE-ConnectionGUID: 6vP95KulSpacy0iH9ViiHA==
X-CSE-MsgGUID: RdWKMsDwRuatIUhrSSAbjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4042905"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4042905"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 23:56:39 -0800
X-CSE-ConnectionGUID: pYagR8l/QES8QaQSKz7jgg==
X-CSE-MsgGUID: asRCAulVTzy9DCCGKC+r1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10530155"
Received: from unknown (HELO [10.238.1.144]) ([10.238.1.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 23:56:37 -0800
Message-ID: <56be2b4e-aefb-413b-8f72-0bea1f9e96db@linux.intel.com>
Date: Fri, 20 Nov 2026 15:56:34 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Robin Murphy <robin.murphy@arm.com>,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] iommu/io-pgfault: reject partial faults after device
 removal
To: Qihang <q.h.hack.winter@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
References: <20261117015409.25492-1-q.h.hack.winter@gmail.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20261117015409.25492-1-q.h.hack.winter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/2026 9:54 AM, Qihang wrote:
> iopf_queue_remove_device() kfree()s the entries on
> fault_param->partial without unlinking them, leaving the list head
> pointing into freed memory.  Since a74c077b9021 the fault parameter is
> refcounted and can outlive the drain, a report that took its reference
> earlier can still list_add() through those pointers.  Unlinking
> instead turns that into a leak: the late node lands on a parameter
> that is no longer on queue->devices, whose final put does not free
> partial faults.
> 
> This needs a device removed from its iopf queue while a non-last
> (partial) request is in flight, with the caller not blocking new reports
> for the duration.
> 
> Patch 1 unlinks each partial before freeing it, matching
> iopf_queue_discard_partial().
> 
> Patch 2 adds fault_param->removing, set and tested under
> fault_param->lock: a late partial is either drained, or rejected and
> freed by report_partial_fault() (-ENODEV).  It covers partial-list
> admission only; callers must still quiesce reports for the remaining
> lifetimes.
> 
> Both patches are scoped to fault_param->partial, not the group path,
> the attach handle, or paths that never call iopf_queue_remove_device().
> 
> Verified on v7.4-rc3 with KASAN + DEBUG_LIST and the iommufd mock
> driver, its caller-side IOPF serialization deliberately removed and
> test-only delays added; this shows the mechanism, not production
> reachability.  The runs cover queue-before-removal,
> removal-before-insertion, concurrent late reporters and re-enable.
> Each round queues one partial before the removal and then races the
> late reporters against the drain, so a clean run ends with every node
> accounted for: 1800 = 900 + 900 and 3600 = 900 + 2700 (allocated =
> drained + rejected), counted at a final removal with no reporter in
> flight.  Nothing was left on fault_param->partial and KASAN stayed
> quiet.
> 
> With patch 1 reverted, the report is:
> 
>    BUG: KASAN: slab-use-after-free in __list_add_valid_or_report
>    Freed by task 1: kfree <- iopf_queue_remove_device
>    56 bytes inside a freed 64-byte region (struct iopf_fault, list.prev)
> 
> With patch 1 only, the same reproducer runs 1460 rounds without a KASAN
> report and leaks one late node per round, which patch 2 addresses.
> 
> Reachability on an unmodified production kernel, and any security
> impact, remain unconfirmed: the test shows memory corruption and a
> KASAN panic on the modified mock driver, not a user-triggerable bug on
> a stock kernel.
> 
> An AI coding assistant helped find this defect and build the
> reproducer and instrumentation, which are available on request along
> with the KASAN logs.

+Jason

The issues addressed by both patches are false positives. They rely on a
fault being reported for a device after iopf_queue_remove_device() has
been called for that device. The iommu driver must not allow that.
Pending i/o page faults must be drained before the device is removed
from its iommu's io page fault queue.

Thanks,
baolu
