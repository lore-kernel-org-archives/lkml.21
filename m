Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795166794;
	b=yWSvDnzcbjRfqNGIiP23xKoj5+ZFo1x6RPzneGSm0Udy3qGKXHCU7S/3p7MUHZanYnq1
	 WmpGca9VR6GyF3/BPYxL1I70szR/lMAXQh/Bx7wZRFdxxB1WM+9EgsMmSsDCJuKjNgd6b
	 T0eFUSvAPKdfdoAvEkvrvrWi+OYViRjgrupKRr6eU+4Z0AAqKrer2UvGL8lTsHA0btmai
	 AIow0WqjmLwSXEcxzv2jOo+bZjyx+zw9pRLkpeIiZQq2wXE76G31MB9wxP4Gocn1xfxWj
	 Sn08xIgpzeCdaRSd2u56xxFvyILlOG6d85gigBZkDAjpWLzVpFq9zcxQnRujGbWSHBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YLVHtNfEKOoQsgj7eBA+fP9IdBA3FfwhirmQVmJV3Ms=;
	b=hfHtnSwLYOgNx/d3xDhw59ePCQt0b/VYJwkiPirm3HFRjzkOSoeVvPzFgeVqTQNw7hls
	 d5k0GRTDk3BKmWstY+xqtX1JnXEafl9x2umoACaqKfFeSCwvQqw6mfA8gZpGmLAtkbyZk
	 Zv4rnlZ1SXOoBCC2q8rIsymaBt86yUxGZbFjPvU7NBsNvtJQP2Dj2Trt0qm/4lUeY0SML
	 NyT6spXq4Bs/Kt0BUA0OGYU75WDt0oHlmuDCDjymXUaPdd19zHc5VxAAEoHNJWdxGXzZ5
	 sy3+lL05fnb/0pNpAcgrdj/4bWs09RV1TOMSkBj9/+/dIO7z73UlCw9MvI2IQWabM+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hFMtq/Ly";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D2A606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D2A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hFMtq/Ly
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ed0f842b02so292425ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:26:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795166794; cv=none;
        d=google.com; s=arc-20260327;
        b=c0t5oQynfZTtsoxMIIAb2CUYtFQkUjAJGfD7iuAh0vWjdasVeuqjfn/YKt8AUqyQrW
         0NTsD586Xqebb6pFjp6QeynKb7z+HycrZk+olH1GXz7mvakcKjvDq8FkBo/dMuNQQA2E
         2lHxloeBn+Tdq48x9KAkEf0P3jjLByW7/jKV/eOld0tCJ8v7acgPIdUDtWZI6gtA/y1t
         YFK9nq/P5jw4ygwyCHi51ztdvuZ58CuCbJHN3eLx6Bese+ReO5v/eHfu1uZB7sa1VeUn
         SK7jCpP9B9AFXhOsRQ5B4a/dtaSk6VQ9DHewz0fKLIKIxw2cv4DA74lMZ4/bB3l3Q+rN
         pmzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YLVHtNfEKOoQsgj7eBA+fP9IdBA3FfwhirmQVmJV3Ms=;
        fh=GNwITTccLnGsPcGeoaUBSRffyOhSPmAkKnJptRw6e+k=;
        b=oRFRjiWiYXcNcCX/AecsbNVuK9iIWAY7ojjca2tkdSPOVebV6gEq8AjC6oOBrQPzU7
         DDo//SeTk41tUv4T/VA0CFI4KPVtpPj+ebMV68sPkWrrcp3lJy9BzpYkQqvkX78gM0A5
         zrAqmPuggA5PizZKlJgdpNAzej1s9vmRTqxfWMgNu5xryLVRnrSTRJJ/vtpUd1jg+Eyy
         ePpWT3l6Y5tfVrcn+jbQgh7swwCFP5+goKIFlb64/nSEUlmYzGr/UVSrlcm19Fjd/4xu
         G/RleVwk4KjWTpCvv10ATwhk5tYdiP5p5Mse2vd2bGyiUbwxgqNgqC0Tr24tXqCP+HmF
         r+pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795166794; x=1795771594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YLVHtNfEKOoQsgj7eBA+fP9IdBA3FfwhirmQVmJV3Ms=;
        b=hFMtq/LyfrmfE6bEguvNRZevpTClAj/dNdneyI7GbHYa3GYNEdI1VCMFT5Ke6A+K+0
         TJmmPxbV+upfbgPgQ1U+72XVI7WWySRXs7UE65ITFbbUH3DTJiIQ235PRN1brMfY2n0e
         ZzjcYNTIeGDGjJRNJP7HUFfns5Yyjfhoxn2XWItMOHPh1QCSMaKaZSykeuCWqGvT4p8v
         FUU0zhHEiZ/AClTA9Id4ohmesT0QzhV7hjzLY+dtFimArrRXp70p2kNYgeoRIOXVDaIf
         sG0uzoVbsCF3CACZv+yb8L701jFszj18Uhr9IzkZ7cR3RlwMq65WheoR1NCMJ7aCsIn5
         r1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166794; x=1795771594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLVHtNfEKOoQsgj7eBA+fP9IdBA3FfwhirmQVmJV3Ms=;
        b=tboewzpCnKqUNcf9xQKG7bwv5cOxWPCPquy5c9FDwtnq7tC47y0HxmuzoGSEi20zez
         762C/XXwu23xF0S6SKKPX8fdUP4CZcTa62pTzkthQWdOnyKHG95kmMj1eryKx45LV7p/
         0T5WkbcuRT5nnZ9Xs2gJ8mEQvi3XZMwrPRUsGbuUwCbNjoy2HgRMrrsMRoZMrEW/rOKb
         sJie0EpfuvTwL3KZ9mAhxQnKbSPvXXtwWCBtk/ERzsV2pAXCD9yYomClBMOR/wg6B6CZ
         yl6wt19PacoGYTXGGuOeiVKRe1iQa+BKobT5k5aTIx9eCHEwgTVRlGyBRqnPT8GvWoYW
         0TTA==
X-Forwarded-Encrypted: i=1; AL+hErH3bwh59SD6bF+5DUFvb21R0P9IHYCJLHFq2z5/F0AUG/tZh5MtiqP7X3xcEBkB0Ag+UUAf02L3KIanehM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UGesoqwzsYDPggaFXySQp+5c3482J1ct2u6a9/fNX9go6ykNX
	eBe1fwOxqFt+SLYpe9sCaIaYf+wLe+WL5BMKWeEvrqgNEjoOmQ22wPqphhVaGFdYYtfVXemQ8Hc
	J0aWN4Ko5T8KJfsGMxy0sVZ5l+QkAj7g=
X-Gm-Gg: AZFdTZfVbpMnSbgN4c4rE+2IdCk2jARZTZFTOjzXuXC4JjXIHRcZoo3lNzyjVU3IJO3
	Kjs2Rpm4QoM89U4dIGi9DrTKvllbKCuHhVQs08ci923jHqJQy06SES/D4jFdHbYm6/oAjDxo1o/
	OTWDRafhnkayH6hwqNpvWdHM2I82HDcaDy6dr4A3B9sr69QyScqH7TiFZYodb4nwUhcWEUoVlxt
	Rb9RFitynz4jRm4FRg2QhXu4mrQ68SeLDMMIjBXWKu77jiXKfswFvt4TNIP9hECmQUm2bsQpF7q
	bLWgKD0YofNEUI8tS6+U2nXXcfV+3OoFlebsIfEiggLciYQvysygNjsBLIVFt+wxkDbVVptew41
	/9vUb+12E3b12RRa5MVvDpH3MJ/7wLYqFEy8Lq/oaFFjG508xzulKItKG9J3Ak7iweSBROfU=
X-Received: by 2002:a17:902:d547:b0:2f0:33d8:f88d with SMTP id
 d9443c01a7336-2f03ee6fa4fmr43299475ad.0.1795166793696; Fri, 20 Nov 2026
 01:26:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117015409.25492-1-q.h.hack.winter@gmail.com> <56be2b4e-aefb-413b-8f72-0bea1f9e96db@linux.intel.com>
In-Reply-To: <56be2b4e-aefb-413b-8f72-0bea1f9e96db@linux.intel.com>
From: Qihang <q.h.hack.winter@gmail.com>
Date: Fri, 20 Nov 2026 17:26:20 +0800
X-Gm-Features: AclHuK96MsvfmI4xhRwe-8BPGXSUlpaPU2PaBnGT6PTcIOYEbLNBvWMF0ZGTZE4
Message-ID: <CAH78GvuUtU=zhe-Qbn9k73D3U5n1Ye1=8wtQqR7vCEpDzgNUJg@mail.gmail.com>
Subject: Re: [PATCH 0/2] iommu/io-pgfault: reject partial faults after device removal
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baolu,

Thanks. I agree that the driver must drain pending faults before
calling iopf_queue_remove_device(). My selftest removed the mock
driver's serialization, so it doesn't establish that fault reporting
can overlap removal in an unmodified driver. I'm withdrawing this
series and won't resend it.

I still have two questions about where the drivers establish that guarantee=
.

On VT-d, blocking_domain_attach_dev() calls
iopf_for_domain_remove(old, dev) before device_block_translation(dev).
When that drops the last IOPF reference, it calls
iopf_queue_remove_device(). On an SM-capable IOMMU, for a device that
isn't a real DMA subdevice, the only PRQ drain on this path is reached
through device_block_translation() =E2=86=92 intel_pasid_tear_down_entry() =
=E2=86=92
intel_iommu_drain_pasid_prq(). By then iopf_refcount is zero, so the
drain returns early.

In the same file, identity_domain_attach_dev() calls
device_block_translation(dev) first and releases the old domain's IOPF
reference afterwards. The comment there explains that putting the
device in the blocking state leaves the IOPF reference count
unchanged. Should blocking_domain_attach_dev() use the same order? If
the current order is intentional, what ensures that pending PRQ
reports for this device have drained before the last reference is
dropped?

On AMD, detach_device() calls iopf_queue_flush_dev() immediately
before amd_iommu_iopf_remove_device(). The flush helper waits for
queued work and documents that the caller must have flushed the
low-level queue first. The PPR interrupt thread calls
iommu_report_device_fault() directly, so waiting for queued work alone
doesn't establish that the thread has finished reporting faults for
this device. What in the detach path ensures that PPR reporting for
this device has quiesced before the device is removed from the IOPF
queue?

I may be missing a step in both cases. A pointer would be enough.

Thanks,
Qihang

On Fri, Nov 20, 2026 at 3:56=E2=80=AFPM Baolu Lu <baolu.lu@linux.intel.com>=
 wrote:
>
> On 11/17/2026 9:54 AM, Qihang wrote:
> > iopf_queue_remove_device() kfree()s the entries on
> > fault_param->partial without unlinking them, leaving the list head
> > pointing into freed memory.  Since a74c077b9021 the fault parameter is
> > refcounted and can outlive the drain, a report that took its reference
> > earlier can still list_add() through those pointers.  Unlinking
> > instead turns that into a leak: the late node lands on a parameter
> > that is no longer on queue->devices, whose final put does not free
> > partial faults.
> >
> > This needs a device removed from its iopf queue while a non-last
> > (partial) request is in flight, with the caller not blocking new report=
s
> > for the duration.
> >
> > Patch 1 unlinks each partial before freeing it, matching
> > iopf_queue_discard_partial().
> >
> > Patch 2 adds fault_param->removing, set and tested under
> > fault_param->lock: a late partial is either drained, or rejected and
> > freed by report_partial_fault() (-ENODEV).  It covers partial-list
> > admission only; callers must still quiesce reports for the remaining
> > lifetimes.
> >
> > Both patches are scoped to fault_param->partial, not the group path,
> > the attach handle, or paths that never call iopf_queue_remove_device().
> >
> > Verified on v7.4-rc3 with KASAN + DEBUG_LIST and the iommufd mock
> > driver, its caller-side IOPF serialization deliberately removed and
> > test-only delays added; this shows the mechanism, not production
> > reachability.  The runs cover queue-before-removal,
> > removal-before-insertion, concurrent late reporters and re-enable.
> > Each round queues one partial before the removal and then races the
> > late reporters against the drain, so a clean run ends with every node
> > accounted for: 1800 =3D 900 + 900 and 3600 =3D 900 + 2700 (allocated =
=3D
> > drained + rejected), counted at a final removal with no reporter in
> > flight.  Nothing was left on fault_param->partial and KASAN stayed
> > quiet.
> >
> > With patch 1 reverted, the report is:
> >
> >    BUG: KASAN: slab-use-after-free in __list_add_valid_or_report
> >    Freed by task 1: kfree <- iopf_queue_remove_device
> >    56 bytes inside a freed 64-byte region (struct iopf_fault, list.prev=
)
> >
> > With patch 1 only, the same reproducer runs 1460 rounds without a KASAN
> > report and leaks one late node per round, which patch 2 addresses.
> >
> > Reachability on an unmodified production kernel, and any security
> > impact, remain unconfirmed: the test shows memory corruption and a
> > KASAN panic on the modified mock driver, not a user-triggerable bug on
> > a stock kernel.
> >
> > An AI coding assistant helped find this defect and build the
> > reproducer and instrumentation, which are available on request along
> > with the KASAN logs.
>
> +Jason
>
> The issues addressed by both patches are false positives. They rely on a
> fault being reported for a device after iopf_queue_remove_device() has
> been called for that device. The iommu driver must not allow that.
> Pending i/o page faults must be drained before the device is removed
> from its iommu's io page fault queue.
>
> Thanks,
> baolu
