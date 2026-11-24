Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549669;
	b=w4hN5FhLciax7B5a9EBR4IqbxfHNwfZTshVVhn4l8X04rbbkTOD7Y4KBjrWfHu08HHVv
	 DyKREaKdiylLAT3GVGSWocyMafNNWbR3phW16kwT4PVeeuwbUGihWYV4Ept/3Nslacwqm
	 M0SWlvWj/U8VMG49osAA0WAuEx+x5nAVuC3q8EMuM5qR9zD8KSVi36K6gwuN5DnTHMCFe
	 s8hcR41kXIt0kfUhMG/0WSyP76oehVd4g+gAiLMaiW+EBQGh9XQytSuPWwHtl2EyklLsC
	 nn9bZQVZuECFPP44pW5JuX0E7AtQTOmU0ZQ7h+o8oJVVADpHqrMsATSg8v/zDTFOHQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=lUpe/tRxEZ5NPFIdAznJnUvDVmlMVX6s3wfMo2I3P5U=;
	b=yRtvklFdsISKzdV1xKp84bBYJKgJCgZxZ2E0ZkBg052zYF7PlfI2WbbtAYTdYpLi7qpZ
	 TJk20OxOu4XKBQnR/uoIkG4EQ3HNYNVPGM1RI9Nt6kGLl04sghd/KASVA8nL6d3Vqwpbn
	 X5wyGeP9oHxQR4Z9SoyoaxrMI7RrsGqPMClJoKSijDiLp53Ir4d8IwfnQst1yr1XPDr6g
	 IGgAK5QU8sRIud0BRnp4nAkuVklZg2vOWCfqz1U2zLKXPQ+p/YdyTzpm4VLrsHWHdmucw
	 5RNB9GY0hTuyocM5NOyxyyWyjWIpMnpno7O9ZDQXm6nK3y6osok6rWseHpL/DDDGlRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hkDQJ8SE;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AEF606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84AEF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hkDQJ8SE
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so3925025a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795549669; x=1796154469; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lUpe/tRxEZ5NPFIdAznJnUvDVmlMVX6s3wfMo2I3P5U=;
        b=hkDQJ8SE9T5NTx+bSFOZ+oAkTZjhjNqbr5FwlOIkYHU2pfuWXC4hay2mNhTxK23qcb
         E8pT2H1fsqK37LeIiSSxX+PRvqqMIlXOGG1K5wMto2pHYRL7DGTrjN32Kxqb5iHlE1CU
         u8mGCY7DYmYOnknCKDT8FMwDs5wZDo3rUKOjZCq5TlJv7ns4QVJIwOYleRHqUCDxLmbb
         7YnPGhg7aqE+4Hv3MnHRPSoR4oNT9YVwd86QcqSi2X5nJU1eg+L+AM7gmkVbGnnDdTIi
         khfGHwB06pBcZLt4VFZZPlFrOhNv9bh5Db3XcBIMRmkCvI+BTRNN1Py8AOJ39USrGJ+v
         4xPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549669; x=1796154469;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUpe/tRxEZ5NPFIdAznJnUvDVmlMVX6s3wfMo2I3P5U=;
        b=XgOcTZ/cmvkBuiIoXz8/uULBc9H28SH6GFjNmtZRy3bqJzkLMFCmI4WuGISBl4/4M4
         tksb4eGBt+W58xz+h0AyVDnZ/8pNXovRiVfc/H0cIz3T43mbKaReb1KAmoqEFAsPud/6
         uuLYPzPAKiNlHpUanIY+7ekpR9A6qdSAMA7HwPrvdMrQgU/cS4jpNaFSr2fwuDM87myk
         S8UPcv/zMx9F5z/ooTh1W8aksso6PN95Nownm4wylagPjRVKgVzj8H+9rgUODDlkF6a4
         bwjhUkurnG0pXSuIm74ZgYue3NgdAimp58voPlkzYi97Pklz2+Xf1ZMECHPL9lXgH9hk
         ogWg==
X-Forwarded-Encrypted: i=1; AL+hErGNsNFDafdD/oBNjNKtIhCrvTFJP8YiR4ZK5ThofiFOU5A17EPWfTArsFGqjgAA5Hohjh45jybsbTUAFSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ABRoFMF/s4W7Hg2AD3OxHC1fh2scs9C5cPPU2/9A6CSiPF5E0
	3O7aGLBkdQb33+W5vSBLwV9Aq5zAEfnqc+KXIUjIIVT96hsgzx3KbXdYqQ9jGQELVQ==
X-Gm-Gg: AZFdTZcmkzJzCDXJcESo2abR/ElS8qDclNmU5IXJ/ubCf9TKxjPz4pMY/ntvwCsGi3E
	ZdJAaHNKTXDzz5qniTAXVtT1luDs2/9FHt3uBjYekreklYfudW7qz7V7HLcg8oYMf46Nxjdwyht
	+RkpWI5pcBDg7sVLvWGCddzhvZxVndTau8R3wTt5IkfE9j3Z/GVROjUWRLg71EDn2e+WUCXlTs9
	6MTItKFjgoHIRmA4yjLd3qfrLmnndB/muSuf2ONVqajkCl4pK60jDbcDJi7oCQJ44qtm8w3cDgR
	nFC+WMHNK0uKzJ13IkXsWlFoXdMV7RVVVruTGr8GXiLR3y6ZF9RoKJ+uIFLTSVd/7gxe6pTD31Y
	Bt77TYcqTpVFGQuZru75kFjTYVOxTnr/5/0mb9PJJcOKpeHDpg5ix7+o5+jY2Vqt5MMW0fsDT45
	DJycdcVCsh8Wz2NN7rW8DmsXALeKYkuSrlcUTMQ9bFAMr+Na23qdxWMRSqX2XvA30Q1SowsN47Q
	cZNkDmcsyNG0RT9KS0x6dqjFHgq3lpo947ybmIowIV+jeBg/kE0VIx2OVA3u9Wu5vOMCjpkHLE3
	luTAVaeTHKsAH2qhyEwjePVa/fx7NcoeqQeQfz52qpdDeR1rXVg1ERrCzFWLjp32
X-Received: by 2002:a17:90a:e70c:b0:3b0:d551:ab2 with SMTP id 98e67ed59e1d1-3b41c955b0emr14483470a91.51.1795549668300;
        Tue, 24 Nov 2026 11:47:48 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm23939545a91.15.2026.11.24.11.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:47:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 11:47:47 -0800
Message-Id: <DN3P8HO01T16.1XHR8MD7J5JSJ@google.com>
Cc: <linux-pci@vger.kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Lorenzo Pieralisi" <lorenzo.pieralisi@arm.com>, "Rob Herring"
 <robh@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Williamson" <alex@shazbot.org>, "LKML" <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2 07/16] PCI: Serialize bridge window sizing and
 resource assignment
From: "David Matlack" <dmatlack@google.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "David
 Matlack" <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261120134716.3027-1-ilpo.jarvinen@linux.intel.com>
 <20261120134716.3027-8-ilpo.jarvinen@linux.intel.com>
 <DN314UP7ZLCR.39N4XNGLWKR05@google.com>
 <42d7af61-bf69-b440-8685-5d9cec4863dd@linux.intel.com>
In-Reply-To: <42d7af61-bf69-b440-8685-5d9cec4863dd@linux.intel.com>

On Tue Nov 24, 2026 at 6:10 AM PST, Ilpo J=C3=A4rvinen wrote:
> I don't immediately see anything preventing from moving it into the host
> bridge struct, I'll look into this.

Thanks!

> Not sure if it really helps much currently because pci_bus_sem is also
> held but that might eventually change (there's the series which
> attempted to split that into a separate lock in each bus, I don't
> remember why that work stalled).

A lock per bus seems hard to get right, since a sizing pass or a BAR
resize can span many buses and you'd have to lock up and down the
hierarchy. Per host bridge avoids that.

> ...I already have another (unsubmitted) series that adds
> pci_rescan_remove_lock around host bridge setups because they too can rac=
e
> with a sysfs /rescan leading to adding devices more than once, etc.

That would have saved me a lot of head scratching. Please Cc me when you
post it. I'm happy to review it and test it with Live Update.

> Now I actually started to wonder why couldn't pci_rescan_remove_lock also
> be per host bridge?? (+ a separate lock to protect root buses list)

I've been thinking the same thing. Both pci_bus_sem and
pci_rescan_remove_lock could move into struct pci_host_bridge, with a
small global lock for the root buses list as you said.

A big benefit of a per-host-bridge pci_rescan_remove_lock is that it
makes it obvious which lock to take during boot-time scans: the lock of
the host bridge being set up, which nothing else can be holding yet. It
would also solve the re-entrancy problem, at least for VMD.
vmd_remove() could always take the VMD domain's own lock, which is a
different lock from the parent domain's, whether or not the caller
holds the parent's.

Eventually, the per-host-bridge pci_bus_sem and res_setup_lock could be
merged into a single rwsem, with sizing and assignment taking it for
write.

Thanks,
David
