Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614139;
	b=jpiP3ngh+/ioQwbys2UNIs1RXO5mc+uhSMaUGHPXiUxfvss7Gvhkem/JyMBlLHNwjxXB
	 88+Q/6/WshPhhGHGWVDK/gELeNfFSxSfT1YeuiIA02T1Kc0cin0wn396xbqhwAhgSvT8t
	 7iTrMF/uyF0wHWVXdMdiNNR602NkvYOJ1i8HLRePMuOz7RFRTilb6FyQtgC4z4P1b5RpF
	 HQzdVc7RBk2Azoj7rpynsOO6wA7YbjwG+hzjTdc/hQTqZ2xR4+bPNs5dJ1IcHW0zSHwbG
	 RM0f99/BNXfRAWYNEWZIiE4/LmLBk3Byi7ocfB3TNuNg3TJKmyDnFMCvkUFg62z+8lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RgRBi4Exuv8nq+VhlE2oQhamCxOtxwj2AD7UWFn0Grw=;
	b=nlEHLQgJxiKoIVYVa2xFHQShde4QFhMwYRBYDOkq71GUaQovslBstTd7ByroNNiJLDhP
	 DmwCdyuuEwgkVZcMKYJd1+UXZ0i2fjurONIFZ5RvBU47I0ojY2ubJ3D25ybsYATcFRZeJ
	 Xulmlpu1LiSOYdRiViK1bhlDvPk2wvAFebegJpEvENX6d3+ITRI3ggzkcLNHfiTnsLxzP
	 PcM2zq/CK5+a2QABuxhquWFG7HMO80sG2Uffwvv+LNlO28sCsqpXDj8m4pTjz4tBqtBSP
	 BweEenOKZYG21/VqM0ofd+YXKH0F4VQp2lS4Lvo+fbBLFOW9FQpgXBZzwZ7/yB8HpAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IplUWbgb;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBBB606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBBBB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IplUWbgb
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-150ef97e790so35159c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795614138; x=1796218938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RgRBi4Exuv8nq+VhlE2oQhamCxOtxwj2AD7UWFn0Grw=;
        b=IplUWbgbS9FL4a3Nig7c3FEuaowPX3ddyUlH5/bSWhAv0RbvH27O/DEOtT4NhBiLt3
         Gmeyv6UjCcTcNKK+uGWXxJO4PhmrOqV4NRNYrtevLixqxKUuZLTc0vwPNwMInE7crkis
         9qX5M9JC7CxsBf2Dilqip1nNJJtTBAKcQnqlx4opSywJ0ropWbsnrRhX0b+wpDbUHAhj
         ExcGN8E76+RmgC2k5mj8i9rY/HA/jvcexVTtAstYEizUmboiRPeIunb8dxJlCUfgQYdM
         BoX/4lVbEXCv8pZJmpMY5waHkFZZzcyVI4iM97bKuIl1Xqr4oi0DHoOvxT2/XoByTap0
         eylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614138; x=1796218938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RgRBi4Exuv8nq+VhlE2oQhamCxOtxwj2AD7UWFn0Grw=;
        b=Meie1LkzLLpoO8Sk99fTY+AkPMRubE2vm6WbokKCLV7YPDp9/b1Rq2XoT5w+MKyuSn
         nT+S9/q7NJDmsOc1qKO5oHTCZ/th0ePcsQb+Ehk0GNZ0m4EXaWp8KnpCzJovFiofW1vW
         zMluEUYWrZUmX7wYKgGPkY7GPHy+/Qsg4CS/FcAzbzHazy2X6QuPnEYnsSXxD2jRr81o
         IxspXmiRvbczVE07jRCmjQochqHQ2iiBrS1kXORueFpruBHWEq+1Jp7Rb4b3mBchmYr/
         Z68D9VJDt4W3zVAZo/JNiz+956SDe84aOyqSgPZMzdhJLXkbGRCga0bRQC2A8oeRlxde
         24eQ==
X-Forwarded-Encrypted: i=1; AL+hErGJYUS8yaN5G7gS7z4vnW5iPXlDanZAooQqiSBZDGEIG1C94Xue2U7GjXcubYTVCR6B24owmvsinGOBXuA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jPwDqOVz7brWS5lYP1iilKt8ONd9da9cYt6XpBJtW+ILdZO3x
	HQ4fGp0qZq5KWhj9LbHQo3W89CwmpwS0FQXmY7BZg/M/tlwMJojHHkLsr8ep2do6ZQ==
X-Gm-Gg: AZFdTZdxT/SC+J/AVKX8Udf78Y8gJRB12Be4MqK2oH79TDnqaZomWNAAhU+kcAFDlps
	xmWehmzcXykzuUdkqAgQb/3MapwULQ24P4q/oyi5N/YYvVZd2dRcdh1ToSKupla0WHXABK8/6Fd
	y7oz9/wB/k6VUIAGfVk7LMG8s0o15uLErA/a/h9d3H24nW3AxNlnEVHST6rwa1jXZzIy+yk6kO1
	MCUmdwFxR+Z1p8aaSOoyxmmiseHtvM4c5S+ibNV3X/xR7w/VK1/aLJ9oQZRyCqOb9HIvS6kGMaC
	3VN7av4GbV0nTCuW15MJUmbQpmY6fHSz5TR8FCCAkJ8P9OU85GW13JBOMNxsel5gSt5UrUfJePP
	KVfp7FP5siN0yuJbxRmRll6vynNCUEWSBb+ufPIQ1EHxMi50I5eKmhIZ31/4i8ryeP0SRu1Ms6J
	Zrl+Gi3lhof9C3m0f7FXeynaGyNxcjV2kznmoIHXm9uLXPK+/yKK/wdBe5GmdVRYo2VZeQtfRBB
	CL7npcHqZsRExojJE5xvAaURSE5SLkgZAHg58u+D40hxXJ4mx/IkFpSRs7sPKDzZsfjyA2Ps7Ej
	et4BPUiIK0RxAq1VeeRYTmfGQGqEQhblxE0GfrzDizY9oxU0ksypYTeHPoFRhDzvOOA=
X-Received: by 2002:a05:701a:cca2:20b0:1b3:c4ba:8e0b with SMTP id a92af1059eb24-1b56338d12dmr4008785c88.2.1795614137046;
        Wed, 25 Nov 2026 05:42:17 -0800 (PST)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm61787393eec.26.2026.11.25.05.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:42:16 -0800 (PST)
Date: Wed, 25 Nov 2026 13:42:08 +0000
From: Pranjal Shrivastava <praan@google.com>
To: John Garry <john.garry@arm.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <awblsA9PMu4jwd3P@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <0fe0d909-a01b-4f4f-9faa-c533b8925f25@arm.com>
 <awRDwxkrZjouy9b9@google.com>
 <f0cc8236-d06a-4f2d-a9fd-e60977017979@arm.com>
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
In-Reply-To: <f0cc8236-d06a-4f2d-a9fd-e60977017979@arm.com>

On Wed, Nov 25, 2026 at 09:37:02AM +0000, John Garry wrote:
> > 
> > > And it would be nice to not add extra logic in this loop. It is very timing
> > > sensitive, and adding extra checks can increase the chance that the cmpxchg
> > > fails (bad for performance).
> > > 
> > That's a fair concern. A couple of things here:
> > 
> >       - The check is on our local llq copy, which we've already loaded, so
> >         it's a bit test + a (not-taken) branch, with no extra memory access
> >         before the cmpxchg.
> > 
> >       - Per Will's suggestion, I'm making arm_smmu_cmdq_poll_until_not_full()
> >         bail out on the STOP flag, which lets me drop the check at the top of
> >         the loop and the extra READ_ONCE(), leaving a single unlikely() check
> >         right before the cmpxchg.
> > 
> > It does need to stay in the loop though, since the cmpxchg is the only
> > point where checking the flag and reserving the slots is atomic.. a
> > check any earlier (e.g. in arm_smmu_get_cmdq()) could race with the
> > suspend path setting it.
> 
> I just find it odd that we try to elide commands here (at the point of
> command submission). I would assume that any commands would not get this far
> - or even be submitted to the queue - if at the point of entering sleep.
> 

They never actually reach the queue: the check is right before we
reserve any slots, so nothing gets submitted.

As for why the check sits here and not further up, we did try that in
the earlier versions and have converged on the current design:

 - v1/v2 [1] elided at the call sites (TLBI/CFGI) using
   pm_runtime_get_if_active(). That raced with the RPM state bouncing,
   i.e. a caller could see the SMMU active and the suspend could kick in
   before it actually submitted (as Daniel pointed out).
 - v3 [2] tried to fix that with a new pm_runtime_get_if_not_suspended()
   API, and v4/v5 [3] replaced it with a driver-side biased counter
   (nr_cmdq_users). That worked, but it meant an extra atomic on a shared
   cache line in every command submission, which isn't great on high
   core count.
 - v6 [4] replaced the counter with the STOP flag in prod, and v7-v9
   [5] dropped the call-site checks entirely, leaving the CMDQ as the
   single place that decides.

The callers themselves legitimately run while the SMMU is suspended,
e.g. a client unmapping (or a deferred unmap) while it's off, and we
don't want to wake the SMMU up just to invalidate TLBs that'll be fully
invalidated on resume anyway. So these commands do get this far, and the
only point where "is the SMMU on?" can be answered atomically with "I'm
committing commands" is the slot reservation itself.. any earlier check
is racy against the suspend path.

[1] https://lore.kernel.org/all/20250418233409.3926715-1-praan@google.com/
[2] https://lore.kernel.org/all/20250616203149.2649118-1-praan@google.com/
[3] https://lore.kernel.org/all/20251117191433.3360130-1-praan@google.com/
[4] https://lore.kernel.org/all/20260414194702.1229094-1-praan@google.com/
[5] https://lore.kernel.org/all/20260527221407.1756491-1-praan@google.com/

Thanks,
Praan
