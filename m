Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795227241;
	b=t2HUZvFGiks7Hh6ULwHpoLTyv3x19c28LRAOJKK9PBfAX8ztrUUvdbsWkiDMy6iGbMAj
	 0SsWcYb5f1bgU5pxTf5LbAeUUsWHaqV5tSRLX8vOtQMNGzmxw0hR10zbaIQiefBOsvOFm
	 qgxKW57xMDtN3I4BPA4Ta85B4ZW3lfPzKxn6PP1PNQLSNUvEIiOYos3Rg4ISytabgm1vb
	 u6aBW4rAM4S0G9/ftGxZcLqDmWy/67D8dQnedZoSLETlO3VFkgPoMUlueCPjXU/QHqOwP
	 P2jVAS7Pp++/goannXs/0ifjdftFHeUUE1C2jGCPeHeaDbQy8pilhgypC33dwHhUzcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795227241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IG+ZJh/LD9XAogPPkpcUkOpfA1PilwYhMDov5mMLDkc=;
	b=kInfZVU30La03GjPO4Nely58MHO8bWfKuf6J6xO3LjEs97QCEcfc0FRQxDxibJ9qny+7
	 LifufMO1QYonSSCjAquHriKVZ1H0o8N+p4ATv2ktn/zHL2ooDYsVIkRgW7aHudDwktSY7
	 pNkPevfa0a9s+Xczm53raLpf61kfnu9zN3uThg6XgD5Mg2hR1ulv5VHkHSxjDvMyOvmpw
	 PvrOB7cqGLPcllQcqz+rJooV+PpXX/OcrvdykxQ19Z7UxIfBKwXtJzhmoOAaAC3Q90MCt
	 MWYgq0fww3QlYUGay9Fsxp/GKg4/5TEwr5T7FAlaP6j/7h1TvIypDseFRjjc1FFNxtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5Ekl+Rn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D55C606A6A6
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D55C606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5Ekl+Rn
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b40a522c00so184159a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:14:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795227241; cv=none;
        d=google.com; s=arc-20260327;
        b=IbSEGykE8A3ZYJ1HQzMJKo/44/+AkGVKqOwVhoC4M6DmLEG8yU7muSS2MMZAAlkq+T
         X4RRfKOMViJYw6pilf6hY+MZbsngtNPygCV1rrVu3YoJpVjHoafeJ4eP2spMRN5pPDAt
         kHV/ecdm6PoGXKdoUhkvTrw4/qZbpQKIOYuNGCy3ygNFJIhfGlZwS5cx0NFurHFlslgp
         dTj58tH6Q/7fRKACc6Agt2kW6PAJLaqq3tmoibDnnIaTkfkKuRDgPaAwRKuiXjzgn/8U
         v2tBWxr54XGvtluOqi+6T9XF6/7gV+hTD4e0FYMavNrQvU1GBGbh+urooqCbD6BIaQaN
         VrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IG+ZJh/LD9XAogPPkpcUkOpfA1PilwYhMDov5mMLDkc=;
        fh=PQeFpPdVD9+EVXd1mhitr5rQflaWuHU+GTQ/eKZh7F0=;
        b=pifGxVSWgbrXewQphvDuUo1GWA+chVZ9G+cUK//2rXVyI8JeTSvBvZWtKCf+laioMH
         SqVmxphGlul5PLvIdHTTglhGgEidb5WM2NyCooBTT5shD0lGd5h/SX1U74fjRd9s8J7r
         BgjiGMpEwvARw1AK4U1/B6cRp4fF4rSgrHi6vztPF78T9H9hJBByverS67ESl3Nkc7Ow
         n93LGrSKxJrgbrJ7psAtSLAk4eDQTBbUJsO4QI/HSRVGLeuwBprTgJ6+Nb8v53Sj2BvO
         ygdOFOV5a15KrM53KHspRwe80lEPJJ7uZzVtPBZbSIKW8zoE5VjzNF+rOgIj9EBjf90p
         Y1Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795227241; x=1795832041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IG+ZJh/LD9XAogPPkpcUkOpfA1PilwYhMDov5mMLDkc=;
        b=D5Ekl+Rn4q1oZg1I7mJcOzwpFt7BSukdBEAahuM1uSLTXcp+x7GBY68rrSRsyT0eiQ
         6LI3yrXnzdLZKKXfwCImu1s3CA3xaM8mPyyKkJn5S/oVtLe53nfjMEbNYXAtOG56sO2p
         qa9czrSRRcwpuEhg8KoWYoM1yafwsp8/65w8vvZ1E6pnUVOPSAH7qZclO1CsT0cMkL+5
         Ljr0E0FrHkxTmGbU9F0Uao8hxWffhZfhRrSjU6NanPJCHobClj3iZzg14zDDv8XcEbeE
         tEcEv3NrBhP7xwYa6XWxU+zA0gCi7+0oLGSMLUaCCd3GJ1LlCtW1YOKKe+0M6CUR6L0S
         cptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795227241; x=1795832041;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IG+ZJh/LD9XAogPPkpcUkOpfA1PilwYhMDov5mMLDkc=;
        b=YST3sfMyLGI3ikkbBYQtGxJh3+Edbl5xstA4QcYeSJw9g/ETJteTBIAoSr+f5JLKTp
         IpriU4DeAPY0l3fGP/83ma7rBLH/mvItIiX8uVr1NsnjyD3/3Swdl9tE6fbDlv5rNv+E
         HmQhfBpEZG7TJunJ2ck0x7CTRKZ+rCKjZBk+jVhGmfmTBxGRCHFZWcUkl0FfqgcVRLzZ
         smkUu+xJ5F/yEb5PEDTBmxN3OnbqV4jwQz7qtunwBn9SGx81vjawbseOONgwTM4/f/9G
         YUEt+6xpkgabQAbigttH9+899Hdf9jCLu89onB1SQzgq8xHCWKzA3SJzbouGPfGlVnF7
         JB/Q==
X-Forwarded-Encrypted: i=1; AL+hErHGacQBsiw+B8J2cBeMkHEDBakIpeZJoLz/xhSdYuQrJDElEod7AchJei7H12AJy3qf4t/qf59Z15d42ag=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NR7Ub94ybn+Oew8HerYTBoileAuh/nZO3TfJEFvs8W3r+kTyx
	hLDkBFdy85oMWwRlM15Syki4ttrLnXcMdAx3bDlAOMSlrEYo2GYVE6nUz1JIQZP7ehEzCbp1T8Z
	06rvnt/oCP8Y3G2Hi1GocX7I6w7cTIybszO5CfHg=
X-Gm-Gg: AZFdTZcUzr3up2OoZPyElHuYBPHJIPqgQyEeyeLQjmsSzi1uUmiKylGPI8Vkg02HK3H
	XA+geChUbX5hlYTN6GedikEX8Raf6EV/DPnEeeUoum4oWr6w2s4t7OOmFfl/4jSYpwyJl1wAf65
	NK9Xnle01iNlJw3vPSm4EDzTYp1znQsCLduh2REyp+sK5mksbRh6A3MTb1bLAjo9XkaO4sAgFCI
	UdvpXH+S9oD1zo3jucHse9NIfbY5KsArvWpQiYu3EAGK3QSZfERQGabnV+037KO4MWVdAaeEsJ8
	yiy7vbG7mns/SAPa8UuYkAUr6gfj2421DvUYrgoy/5u9OqK4b5M42uMCX4my9+95mUMjLh/k7Mt
	zbo7Wfu30HWE7zCGsIiCaZvuqjr6D+jIk30JHA8878NiGLKBG01JZXgYzTY5sZt6kHgfZig==
X-Received: by 2002:a17:90b:2ecb:b0:3b0:9a3e:bf8b with SMTP id
 98e67ed59e1d1-3b41c98a1f8mr7487744a91.6.1795227240277; Fri, 20 Nov 2026
 18:14:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117015409.25492-1-q.h.hack.winter@gmail.com>
 <56be2b4e-aefb-413b-8f72-0bea1f9e96db@linux.intel.com> <CAH78GvuUtU=zhe-Qbn9k73D3U5n1Ye1=8wtQqR7vCEpDzgNUJg@mail.gmail.com>
 <aceb9e9f-7ba3-48e2-8945-95179f22581d@linux.intel.com>
In-Reply-To: <aceb9e9f-7ba3-48e2-8945-95179f22581d@linux.intel.com>
From: Qihang <q.h.hack.winter@gmail.com>
Date: Sat, 21 Nov 2026 10:13:48 +0800
X-Gm-Features: Aa3M54opUKy3tR7eGnpShseaHOR8Dg3J-Z6Ik5gqSO8qnVYY4b0VBcftyM8PVfk
Message-ID: <CAH78Gvubo20uU4ntOxzd-+B6GHpUovL_wYQt9yahF-8=x3sEVA@mail.gmail.com>
Subject: Re: [PATCH 0/2] iommu/io-pgfault: reject partial faults after device removal
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baolu,

Thanks for confirming the VT-d ordering bug. I'll keep this series
withdrawn and won't resend it.

I still have one question about AMD. detach_device() calls
iopf_queue_flush_dev() just before amd_iommu_iopf_remove_device().
That flush only waits on the iopf workqueue, while the PPR IRQ thread
runs amd_iommu_poll_ppr_log() and reports the fault through
iommu_report_device_fault() directly. What ensures that the thread has
finished reporting faults for this device, and cannot report another
one, before the device is removed from the IOPF queue?

Thanks,
Qihang

On Sat, Nov 21, 2026 at 9:25=E2=80=AFAM Baolu Lu <baolu.lu@linux.intel.com>=
 wrote:
>
> On 11/20/2026 5:26 PM, Qihang wrote:
> > Hi Baolu,
> >
> > Thanks. I agree that the driver must drain pending faults before
> > calling iopf_queue_remove_device(). My selftest removed the mock
> > driver's serialization, so it doesn't establish that fault reporting
> > can overlap removal in an unmodified driver. I'm withdrawing this
> > series and won't resend it.
> >
> > I still have two questions about where the drivers establish that guara=
ntee.
> >
> > On VT-d, blocking_domain_attach_dev() calls
> > iopf_for_domain_remove(old, dev) before device_block_translation(dev).
> > When that drops the last IOPF reference, it calls
> > iopf_queue_remove_device(). On an SM-capable IOMMU, for a device that
> > isn't a real DMA subdevice, the only PRQ drain on this path is reached
> > through device_block_translation() =E2=86=92 intel_pasid_tear_down_entr=
y() =E2=86=92
> > intel_iommu_drain_pasid_prq(). By then iopf_refcount is zero, so the
> > drain returns early.
> >
> > In the same file, identity_domain_attach_dev() calls
> > device_block_translation(dev) first and releases the old domain's IOPF
> > reference afterwards. The comment there explains that putting the
> > device in the blocking state leaves the IOPF reference count
> > unchanged. Should blocking_domain_attach_dev() use the same order? If
> > the current order is intentional, what ensures that pending PRQ
> > reports for this device have drained before the last reference is
> > dropped?
>
> Good catch. This is a bug in the vt-d driver. I already have a patch
> that changes the order in blocking_domain_attach_dev(). I will submit it
> for discussion after the necessary assessment.
>
> > On AMD, detach_device() calls iopf_queue_flush_dev() immediately
> > before amd_iommu_iopf_remove_device(). The flush helper waits for
> > queued work and documents that the caller must have flushed the
> > low-level queue first. The PPR interrupt thread calls
> > iommu_report_device_fault() directly, so waiting for queued work alone
> > doesn't establish that the thread has finished reporting faults for
> > this device. What in the detach path ensures that PPR reporting for
> > this device has quiesced before the device is removed from the IOPF
> > queue?
> >
> > I may be missing a step in both cases. A pointer would be enough.
> >
> > Thanks,
> > Qihang
> >
> > On Fri, Nov 20, 2026 at 3:56=E2=80=AFPM Baolu Lu <baolu.lu@linux.intel.=
com> wrote:
> >>
> >> On 11/17/2026 9:54 AM, Qihang wrote:
> >>> iopf_queue_remove_device() kfree()s the entries on
> >>> fault_param->partial without unlinking them, leaving the list head
> >>> pointing into freed memory.  Since a74c077b9021 the fault parameter i=
s
> >>> refcounted and can outlive the drain, a report that took its referenc=
e
> >>> earlier can still list_add() through those pointers.  Unlinking
> >>> instead turns that into a leak: the late node lands on a parameter
> >>> that is no longer on queue->devices, whose final put does not free
> >>> partial faults.
> >>>
> >>> This needs a device removed from its iopf queue while a non-last
> >>> (partial) request is in flight, with the caller not blocking new repo=
rts
> >>> for the duration.
> >>>
> >>> Patch 1 unlinks each partial before freeing it, matching
> >>> iopf_queue_discard_partial().
> >>>
> >>> Patch 2 adds fault_param->removing, set and tested under
> >>> fault_param->lock: a late partial is either drained, or rejected and
> >>> freed by report_partial_fault() (-ENODEV).  It covers partial-list
> >>> admission only; callers must still quiesce reports for the remaining
> >>> lifetimes.
> >>>
> >>> Both patches are scoped to fault_param->partial, not the group path,
> >>> the attach handle, or paths that never call iopf_queue_remove_device(=
).
> >>>
> >>> Verified on v7.4-rc3 with KASAN + DEBUG_LIST and the iommufd mock
> >>> driver, its caller-side IOPF serialization deliberately removed and
> >>> test-only delays added; this shows the mechanism, not production
> >>> reachability.  The runs cover queue-before-removal,
> >>> removal-before-insertion, concurrent late reporters and re-enable.
> >>> Each round queues one partial before the removal and then races the
> >>> late reporters against the drain, so a clean run ends with every node
> >>> accounted for: 1800 =3D 900 + 900 and 3600 =3D 900 + 2700 (allocated =
=3D
> >>> drained + rejected), counted at a final removal with no reporter in
> >>> flight.  Nothing was left on fault_param->partial and KASAN stayed
> >>> quiet.
> >>>
> >>> With patch 1 reverted, the report is:
> >>>
> >>>     BUG: KASAN: slab-use-after-free in __list_add_valid_or_report
> >>>     Freed by task 1: kfree <- iopf_queue_remove_device
> >>>     56 bytes inside a freed 64-byte region (struct iopf_fault, list.p=
rev)
> >>>
> >>> With patch 1 only, the same reproducer runs 1460 rounds without a KAS=
AN
> >>> report and leaks one late node per round, which patch 2 addresses.
> >>>
> >>> Reachability on an unmodified production kernel, and any security
> >>> impact, remain unconfirmed: the test shows memory corruption and a
> >>> KASAN panic on the modified mock driver, not a user-triggerable bug o=
n
> >>> a stock kernel.
> >>>
> >>> An AI coding assistant helped find this defect and build the
> >>> reproducer and instrumentation, which are available on request along
> >>> with the KASAN logs.
> >>
> >> +Jason
> >>
> >> The issues addressed by both patches are false positives. They rely on=
 a
> >> fault being reported for a device after iopf_queue_remove_device() has
> >> been called for that device. The iommu driver must not allow that.
> >> Pending i/o page faults must be drained before the device is removed
> >> from its iommu's io page fault queue.
> >>
> >> Thanks,
> >> baolu
>
> Thanks,
> baolu
