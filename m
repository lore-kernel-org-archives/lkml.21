Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553892;
	b=JCUMCMsSxdW1DrtTAliya3sLHvyWvvNFg6adflRb9om7Rr5vfCpgcl6abhuTvczq5TW0
	 JRcGEYgXkSmOKmMskn5pbvfbu2hi45cjlr0pHw+MX5xSSmtC+/cAl46WUUchaetAxXG7m
	 ggrlqOEjG+PJ0BqJrkF7E5TpziJ5BWTYTDjd+sDBR7RlT2jocazjvCy1xkr8KIiY6Yd5a
	 dtEAV16DO3Mav66vbhFHKduw9yEYGcAowJylSrnukTGhUb50Z+xCEdzGavx+R/hBLFQ15
	 ytUPovYnSrPQrYtDDDLQEmraBva8YOqmMXnTOjX/qN7O0RN5Ggk/0k0ygGSARtp/rtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9lR7+FZK4pMd/mVqImDERZx+vy1vSfASfONjlk0tOlI=;
	b=pF05rnIpKvgwESJ8n4E8rp2EsZKVLwGaUcbaJillzUtJY7Ff8zRE1i4uqtBvaplDDixf
	 XaUVlzPna2DurP9yOSrnXIINAstOA8q31xh34IlnGHkUkMI/81nHgnolsipor0j/MfAWQ
	 9vsEY5ynsCkQlxmpp4whUd8UO3U8c43ddhjM/GU+jvXXpiDN/rIHWwj99ZTD9NzpM5ZP2
	 fjUJJ+GTBy55Jlp5dglJFd8QnOZEjfz0tjOqEzjELMsa43mRfyAt29iSnsZ8N+h/xw2pu
	 SLzv2xdPsjplqQOsG9p56u5q5VFrvlazZQnIvVlJK1JxclI/T+r7hZafVDt/Np7WIxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=ihnZRG2g;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAA7606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EAA7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=ihnZRG2g
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-92125687442so49705656d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795553891; x=1796158691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lR7+FZK4pMd/mVqImDERZx+vy1vSfASfONjlk0tOlI=;
        b=ihnZRG2gf8B2yRsf4VSdENQNYH0yRoPnHblrg5tpFmxciJle3fv4jTODmP2g6gwhIi
         rzp3BJGh+r18P1pklKkcx6oluYpx8nOGsDT//xI5kVXSzV+J5bf4CeZ0SmNB7OCLrm8c
         EfknrcVztWjnv42XKgxpSKsX0/9q4zohHTMYCl2fendQCmu6yk3JS49uVTnJ0WhHSFRs
         aUMg0cnLfUbL6HyIoOZZVIwIbxyP0LBuKXvSF8Yp5QYZoLlyvjDFXbYoscMFg/l8Uow3
         SLAWQJ/FJpGsclswOAeNxvQ1wdmg+5GXuNHovHvXSvJ1f7fcSkLP3hNl/VRdTzXdNB/d
         iIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553891; x=1796158691;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lR7+FZK4pMd/mVqImDERZx+vy1vSfASfONjlk0tOlI=;
        b=PVtqyZb6J19Xt0FlWMkA9cD53gsNZCePacxmoouQu7Vflldu1I3VsNTmoQQoLH4g/Z
         CfmOaf2sHB0B62c9GLSX8MfYV06dUmHCEqvnr+otnXJoVyKKCbzQAc8jWatiURjhpFoz
         ohbzW0LuecLjs2PlpjB2hb7+sqIngz8HAPD4slHxagrZsyyGs3DI7MdomkLWnJiweobf
         MZenbyCqm0tkibmbFo5EHMjuGZT0dsGd/kpZq5QPBtNgaVIbYSqc9QJxPjvzyejCxN2T
         UKlz2q1tIFxActE1rMXjDEFCi2iS7Hd3OAxBliSbhi9uTLwpzMvIa1tmMK34TyOmbMJo
         4LZQ==
X-Forwarded-Encrypted: i=1; AL+hErFBMnidYiLyWFidpK6IdFap+/o4kNDguyES3jxV3nqYtzCL5QaR/3IhgunVBdLyvFNNjZwziNq5WrgFTgc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g9ccd8qgS4536gjJ/H398pP9bKPh8AiAGbMm4tPzLZ6vuPuEZ
	3AELXA04qn/r9qOMhPLyHoe6IQXeD9XSSWTl+4OQ6vORrf13d1Yo6Zq87OE2PcPiOHM=
X-Gm-Gg: AZFdTZdBBQQVR51YtGBCkrI4N8IFk4YcYIWQPt9aVCKUftX/HMqzko0w1ZFZ0I0jEII
	7Ie2EagHPWleddwhwc11Cf5OGlr2tLfc76U7qcN3gJSivkd2FKa0cqjxNfDROtboNv0GhcXWqUl
	4rokXXRXaGwoM3RGOdsjYu3kOzttmRlwL5C9sM/gnLAGNy0jIycKYfLSqfNUkvw/x8X2f4O37ow
	1g11tXOQnNNjV4I+juHOVSQfApVJwinQZImMhpQYLwx29f/69VsctSHp9G3h0Q/SryQOMaoZYBh
	Pgy0r9KeFz4MFwJ6lKfjenRGhWAh+gJ5JZ6+oeb1YkCZy4LZahx9yq2jsNKzxMscdfdV75URo7C
	Asb8SOfMMixjrWjSwvE6GAk1uxaxzKyUbggemF7ZEPS8t/CcB+WT30SWB2vpA/rqGfx/7tWm0g9
	lPxQForCo3Hnih5+rtC3Eatjjc7PTG7cHq+jYkYJpgUu54TvrdeJgJ707NA6CQvA7TNzD0ZbGLL
	3yEOY6mAzi6oqRazOcBnnU0BiqTLeHBSWRbJPSOfjrskcg/HP2n1WnciXq28qDfB4uiFlTaM1Gb
	VzVPXr8HTnB9ctfEOxdoEG8y2ErFaYr4CpNqh/oP4A3VB0NZL2nKp8LUYfpnzu0caP3+QfAjtWZ
	W5lGNDklocP+IzqgkYsPBnnY/pOMjqnfmwDEFgTTVlAkT+6ariEe60785RtuRmR9QpQ60yH9rSw
	==
X-Received: by 2002:a05:6214:3382:b0:921:27a1:a4e5 with SMTP id 6a1803df08f44-92134a9a0b6mr276905586d6.28.1795553891171;
        Tue, 24 Nov 2026 12:58:11 -0800 (PST)
Received: from soleen.c.googlers.com.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d0f6bsm145562816d6.21.2026.11.24.12.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:58:10 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Alexander Graf <graf@amazon.com>,
	"Andersen, Tycho" <Tycho.Andersen@amd.com>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Chris Down <chris@chrisdown.name>,
	David Hildenbrand <david@kernel.org>,
	David Matlack <dmatlack@google.com>,
	"Heyne, Maximillian" <mheyne@amazon.de>,
	James Gowans <jgowans@amazon.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Praveen Kumar <kpraveen.lkml@gmail.com>,
	Sagi Shahar <sagis@google.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Vipin Sharma <vipinsh@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	"Woodhouse, David" <dwmw@amazon.co.uk>,
	Luca Boccassi <luca.boccassi@gmail.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Jork Loeser <jloeser@linux.microsoft.com>,
	Chenghao Duan <duanchenghao@kylinos.cn>,
	Zhu Yanjun <yanjun.zhu@linux.dev>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [Hypervisor Live Update] Notes from November 16, 2026
Date: Tue, 24 Nov 2026 15:58:05 -0500
Message-ID: <20261124205808.4097419-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
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

Hi everybody,

Here are the notes from our Hypervisor Live Update call held on November 16.
These notes are intended to bring those who could not attend up to speed
and to keep the momentum going between meetings.

Starting with this meeting, we introduced an "Upstream Review Overview"
section at the top of the agenda to track recent mailing list activity from
the past two weeks, followed by our rotating subsystem workstreams. We also
began maintaining each call's agenda and notes as dated tabs in the shared
Hypervisor Live Update document.

----->o-----
Cross-Subsystem Versioning & Feature Header (kho_header_ser v4)

* Review Feedback & Struct Versioning Policy: Tarun Sahu reported that review
  comments on v4 of the expandable feature header series are largely minor
  and formatting-related, with no major design objections:
  https://lore.kernel.org/all/20261110050202.529473-1-tarunsahu@google.com/

  Responding to David Matlack's question on whether secondary serialized
  structures (such as memfd_folio_ser and pci_dev_ser) should each carry a
  kho_header_ser or defer to their parent struct's feature flags, Pasha,
  David, and Pratyush Yadav aligned on two rules:
  - Any separate serialized struct referenced by pointer (e.g., memfd
    pointing to folio state, or a generic KVM struct pointing to an
    arch-specific struct) should carry its own kho_header_ser. At 8–16 bytes,
    versioning is cheap and ensures uniform static size checks and
    independent evolution.
  - Serialized structs should generally not be embedded directly inside
    another serialized struct, as embedded structs cannot grow later. Callers
    wanting to avoid allocating a dedicated page for a secondary struct can
    pack it after the parent struct in the same preserved page and reference
    it via pointer (as memfd does for kho_vmalloc).

* Separate Metadata Header for kho_block Sets: David Matlack noted that v4
  repeated entry_size and the serialization header on every page in a
  kho_block linked list, even though all entries in a block set share a
  single entry size and version. After weighing special-casing block 0 vs.
  separating the metadata from the data blocks (matching kho_vmalloc and
  upcoming radix-tree / KHO map structures whose root pages hold child
  pointers with no room for inline headers), the group aligned on Pratyush's
  proposal:
  - Move block-set metadata (KHO's own versioning header, entry_size, pointer
    to the first block, and the single shared feature header for the array's
    payload entries) into a separate block-set metadata header struct that
    callers place either in its own page or packed alongside their parent
    struct.
  - Remove the per-block serialization header from individual 1-page data
    blocks so all blocks in the chain are uniform.

* FLB Early-Boot Versioning: Pasha highlighted Chris Down's review comment
  that File Lifecycle Bound (FLB) incoming data is accessed very early in
  boot—before file handlers initialize—so FLB versioning must be validated
  when retrieving incoming FLB state.

----->o-----
Upstream Review Overview (tmpfs, IOMMU, VFIO, PCIe, KHO & LUO)

* tmpfs File Preservation (v4): David Matlack posted v4, returning to the
  "retrieve into an existing file" model per Christian Brauner's feedback
  (which simplifies the implementation) and splitting the selftests into
  smaller commits for easier review:
  https://lore.kernel.org/all/20261111002358.1842967-1-dmatlack@google.com/

* IOMMU Persistence (v7 -> v8): Samiullah Khawaja collected Reviewed-by tags
  from Baolu Lu and Ankit Soni on v6, posted v7, and received follow-up
  feedback from Baolu that he will address in v8:
  https://lore.kernel.org/all/20261110040828.1774343-1-skhawaja@google.com/

* VFIO PCI Live Update (v6 -> v7 Split): Vipin Sharma is addressing David
  Matlack's reviews on v6—evaluating the "retrieve into" user-provided FD
  model (for consistency with LUO APIs) and a dedicated locking scheme:
  https://lore.kernel.org/all/20261102153656.1431701-1-vipinsh@google.com/
  Per discussions with David and Alex Williamson (at KVM Forum), Vipin will
  split the 27-patch v6 series into two smaller series for v7: ~14 core VFIO
  patches and a separate VFIO selftests series (which David can review in
  parallel while Alex reviews core VFIO). Alex also noted that stacking on
  in-flight dependencies prevents Sashiko bot reviews from running, and
  encouraged broader upstream VFIO code participation from the team.

* PCIe Live Update, Save State Refactor & P2P DMA Selftest:
  - PCI Save State Refactor v2: Pasha and David agreed this ~90% PCI core
    refactor should merge via the PCI tree. David is gathering initial
    reviews from Pranjal Shrivastava and Vipin before pinging Bjorn Helgaas:
    https://lore.kernel.org/all/20261106004218.604799-1-dmatlack@google.com/
  - VFIO P2P DMA Selftest RFC: General VFIO selftest extending Vipin's DMA
    test to validate peer-to-peer DMA across live update:
    https://lore.kernel.org/all/20261111192411.4133780-1-dmatlack@google.com/
  - PCI Core Live Update v10: David posted Bjorn's requested pci_dev_ser
    allocation/release refactor as a standalone follow-up patch on top of v10
    to avoid churning linux-next; only two ACS save/restore patches remained
    awaiting Bjorn's Ack:
    https://lore.kernel.org/all/20261109174009.735309-1-dmatlack@google.com/

* Early Session Freeze (v5 -> v6): Per Mike Rapoport's feedback on v5, Pasha
  will move Linux caretaker-specific logic out into the read-only KHO/LUO
  caretaker series and post v6 as a pure LIVEUPDATE_SESSION_FREEZE series:
  https://lore.kernel.org/all/20261105050053.3063001-1-pasha.tatashin@soleen.com/

* KHO Bootmem Sizing, Observability, RISC-V & memfd_luo Fixes:
  - Bootmem Sizing v3 (Mike Rapoport): Reviewed and ready to land:
    https://lore.kernel.org/all/20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org/
  - KHO/LUO Observability (Chris Down): Strong support for observability.
    Pasha and Pratyush discussed sysfs vs. debugfs ABI stability: LUO
    UAPI-visible state (e.g., outgoing/incoming sessions and FDs) fits sysfs,
    whereas KHO internal bootmem/scratch details are still evolving (and KHO
    should be made more flexible rather than cementing internal bootmem
    layout as stable sysfs ABI prematurely):
    https://lore.kernel.org/all/cover.1794383544.git.chris@chrisdown.name/
  - RISC-V KHO v3 (Chen Pei): Clean implementation; reviewed by Pasha and
    Mike, awaiting prerequisites:
    https://lore.kernel.org/all/20261106071459.2003-1-cp0613@linux.alibaba.com/
  - memfd_luo Fixes (Pratyush Yadav): Pratyush will check Chris Down's note
    on "keep memfd frozen until finish" v2 (already reviewed by Pasha and
    Samiullah), and will send v3 of "don't use memfd_pin_folios()" addressing
    Mike's wording comments:
    https://lore.kernel.org/all/20261110175855.2437084-1-pratyush@kernel.org/
    https://lore.kernel.org/all/20261103172251.2348370-1-pratyush@kernel.org/

----->o-----
Orphaned VMs & Linux Caretaker

* Read-Only KHO & Dedicated Caretaker Mapping Code: Mike Rapoport raised
  concerns on the read-only KHO series about exposing raw physical addresses
  (design alternatives still under discussion). On the memfd side, rather
  than adding a caretaker-specific read-only retrieval mode into generic
  memfd code, Pasha and Pratyush agreed to place caretaker-specific memfd
  retrieval/mapping logic in a dedicated caretaker file under
  kernel/liveupdate/ so the intent is clear. Pasha plans to combine the next
  version of read-only KHO, read-only LUO, and initial caretaker mapping code
  into one cohesive series so reviewers can evaluate the end-to-end design.

* Updating the KVM Community on the Linux Caretaker Pivot: David Matlack
  noted that KVM maintainers from LPC may still expect the standalone
  KVM-based caretaker RFC to be the active path. Pasha agreed to post an
  update replying to the original Orphaned VMs RFC cover letter explaining
  why the Linux caretaker approach is being pursued first (more generic,
  supports VMM/virtio exits, easier bring-up) while keeping the KVM-only
  model in mind as a potential future security-hardened option:
  https://lore.kernel.org/all/20260920193650.3373435-1-pasha.tatashin@soleen.com/

----->o-----
KVM Forum Recap & Meeting Logistics

* KVM Forum: David Matlack and Vipin Sharma reported from KVM Forum that
  Paolo Bonzini highlighted Live Update on his "what's coming in KVM"
  roadmap slide, and Vipin aligned with Alex Williamson on splitting the VFIO
  live update series.

* Community Growth & Potential Schedule Adjustment: Pasha noted growing
  upstream interest from Meta and other companies and will invite engineers
  working on live update to join the call. Because Mike Rapoport has a
  recurring biweekly LPC committee conflict at the current Monday 8am PT
  slot, Pasha will check with the expanded group to see whether shifting the
  meeting day/time accommodates more participants.

* Shared Agenda Document Link: Going forward, agendas and notes will live in
  dated tabs inside the public Hypervisor Live Update Google Doc. Pasha will
  add the document link to the internal calendar invite as well.

----->o-----
Agenda Rotation for Next Meeting

* Deferred Deep-Dive Topics First: Because the Upstream Review Overview
  (including the kho_header_ser / kho_block design discussion) and Orphaned
  VMs update filled the hour, Pasha will rotate the agenda so that unreached
  deep-dive topics—KHO & Boot Memory (including Pratyush's KHO map RFC),
  PowerPC/LoongArch/RISC-V KHO Support, Resource Accounting & Session
  Handover, Guest Memory (guest_memfd) / KVM & Confidential VMs, and TDX
  Module & VM Preservation—are covered at the start of the next call.

----->o-----
Action Items & Next Steps

Tarun:
* Post kho_header_ser v5 using a separate block-set metadata header for
  kho_block (removing per-block headers), retaining kho_header_ser on
  pointer-referenced structs, and addressing Chris Down's FLB early-boot
  versioning comment.

Pasha:
* Post LIVEUPDATE_SESSION_FREEZE v6 as a standalone session freeze series
  (moving caretaker-specific pieces to the read-only KHO/LUO caretaker
  series).
* Combine read-only KHO, read-only LUO, and initial kernel/liveupdate/
  caretaker mapping code into a cohesive next revision, and continue
  discussing the physical-address exposure feedback with Mike Rapoport.
* Reply to the Orphaned VMs RFC cover letter updating the KVM community on
  the shift to the Linux caretaker approach.
* Invite interested engineers from Meta and other organizations, explore a
  conflict-free time slot (for Mike Rapoport and others), and add the shared
  Hypervisor Live Update doc link to the internal invite.

David M:
* Follow up with Bjorn Helgaas on the remaining two ACS save/restore patches
  in PCI Live Update v10.
* Coordinate reviews from Pranjal Shrivastava and Vipin Sharma on PCI save
  state refactor v2 before pinging Bjorn.

Vipin:
* Split VFIO Live Update v7 into separate core VFIO (~14 patches) and VFIO
  selftests series, and evaluate "retrieve into" FD semantics and locking per
  David Matlack's review feedback.
* Review David's PCI save state refactor v2 series.

Samiullah:
* Address Baolu Lu's review comments on IOMMU persistence v7 and post v8.

Pratyush:
* Check Chris Down's comment on "memfd_luo: keep memfd frozen until finish"
  v2 and post v3 of "mm/memfd_luo: don't use memfd_pin_folios()" addressing
  Mike's wording feedback.

The Group:
* Review David's tmpfs preservation v4 series, Pratyush's KHO map RFC, and
  Chris Down's KHO/LUO observability series on the mailing list.

----->o-----

Next meeting will be on Monday, November 30 at 8am PST (UTC-8), everybody is
welcome!

Join Here: https://meet.google.com/rjn-dmzu-hgq

Please let me know if you'd like to propose additional topics for
discussion, thank you!

Best regards,
Pasha
