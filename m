Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630960;
	b=Yx7QVN8SzPFcU10RpeTHmbpstNubEa+4iZPoOy/ObPYdKZgjJvkSwleX554f7LZeLyFq
	 +CuHvXVVb8frdgwK6YVUKnJcXGzu0qBPfDnzeNtJOEE5ld7w85fsIGBk4OLb9V9Gl8zdW
	 DsvkNum0WJgqCh82IK/6CSz3HynbOljkYompGCbWCUwPSorBgk/bIzzYGS8NUoQum0OS2
	 jhl6SWz0bHxvhWFZZdjO3yCmKbNo2YMGX9Hib6rYQxzr6VJIapEvagqEqKQmHLAqladEs
	 3q2tOWLjCtchcd66WxJypD0cpPJpPgFvOhhKowwUmh9gsvngUFAPkXyALfMLZLX4tMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=muHbETEQ5J0nFGhT+U6cGvseIAQr5YwFizEtL9WHdZ8=;
	b=YnWfGflkqy6U5bqate890Lx5wZJ5n7mh53RhvUFrL2QXpI88SwvqwqWJpJu6ZrWxcWB5
	 KUml0EBOz4a2Xq2nDoyxbM5UOzNKZXPp0EIXJo1/IbB3SLjdP7mvAYruf/Y5pWjF9mH2f
	 4iX2T0McERk6DjgY2tJY5YkNFCPnkVAWNMnnQ0hM33/m41mKy9tchWW9q5iGe0DawH83v
	 WwS0dJmrau2TFpFCq9OL/RUSzvhiCmyx4OlRxjfONIJM096c/nR+y1p46ZT0NgF93ofSV
	 BVSD4IEzbEuUbvJQXYKLzTVjSZh6yOau2uTXfumGw1Si4AyJk9wdmq7+gXXDl7mKSoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eJPO8oah;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C56D606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C56D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eJPO8oah
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f053f95aadso50985415ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795630960; x=1796235760; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muHbETEQ5J0nFGhT+U6cGvseIAQr5YwFizEtL9WHdZ8=;
        b=eJPO8oahjXKWiGFedCbZYdGmJq/ZXEI6qzCKDG63OYUAhUlXSifYBiNU4RjoH3r1Wk
         tmYZYvtJAfYbhXFmXuxx8vh9T6zSDgAi762IuX2fChAKETqRwVSu4RVrZeNfquwtXF1F
         A2rC0fgumfErVy4o02s2c3p0D1bAnKjnTdlHCoWNvwEsa7HPqpCNfeWBzvJXDuYwr0i/
         RmJ+FuEsG3GO/rxIURL7jVWHfjyhq1ZD2Ms6wXpynJWSJ2m/SNhX8J38Yp9z3h5pK+Xj
         awpUXUlChCFh4tDUFYJr0zQHBi1OyfY3iginJjqAz/fpE7Oz40bfM0b0uoXoSshW+kPy
         T31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630960; x=1796235760;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=muHbETEQ5J0nFGhT+U6cGvseIAQr5YwFizEtL9WHdZ8=;
        b=AGgzeUQgGb6XJfOxC5jswxS/UWrekiq2IRUi2thqg2CmgtqwTrijUXQdddkIdXfrSQ
         Tgn2Vb9xW+IUo6JfnuQ7za1oV4HlzKA24icHqI85pD4FDkK2F508y9suun2afFpiqrt7
         SI0E0E+ASsJpaCc5TezJq5H3mPvIYTdKSwKSBqREfGvCF4xrQ4ipxRbZgVPKOO4mokHf
         wfYjOlG1sGHnr1f6TbJkXyG2c8gGA7JT8oYetoSuEELwOSn/b7G2nmfOh9bS2+rv3AIb
         YF4nkYKypxuynSrTOjn2M9JpTvy/CvtH+TEaeQt4MzCiKhpEemcPqaVHHGwaDHO/LBHl
         KFBg==
X-Forwarded-Encrypted: i=1; AL+hErFMwy+2k0bXDM6311TkvUcGYAEimclw6IszNh0574JQlREiaEd4VCvHI4zdZfgS3UoGgUBxJ+Z531u9w4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HAZarIbAOjVFB9axxNedqS68bUZOIYbPyaa99HlNSNfQQV6Ug
	Cr/peD0v5HF4DVD+qge+n8WZDweoEIPE8myFEU8ZDizZ0NGki+PwAwocrCxiuwA2VHyIzyetTUc
	WHmCtvGIJx3HId9yGaoapm0W6dIQkWD4NoQ==
X-Received: from plbiy9.prod.google.com ([2002:a17:903:1309:b0:2ed:8eec:6a11])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e811:b0:2ed:3f47:96a3 with SMTP id d9443c01a7336-2f03f169628mr184052615ad.42.1795630959630;
 Wed, 25 Nov 2026 10:22:39 -0800 (PST)
Date: Wed, 25 Nov 2026 18:22:39 +0000
In-Reply-To: <20261016220900.GA2020355@bhelgaas>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260708-pci-aspm-fix-v3-0-6bd72451746e@kernel.org>
 <20261014205117.GA1665327@bhelgaas> <atG61oicHbsLKiib@debian> <20261016220900.GA2020355@bhelgaas>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125182239.2291980-1-rathodpriyank@google.com>
Subject: Re: [PATCH v3 0/8] PCI/ASPM: Add pci_force_enable_link_state() API
 and convert Atheros drivers
From: Priyank Rathod <rathodpriyank@google.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Val Packett <val@packett.cool>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, Jeff Johnson <jjohnson@kernel.org>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Emmanuel Grumbach <egrumbach@gmail.com>, 
	Matthew Garrett <mjg59@srcf.ucam.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Manivannan, Bjorn, Ilpo,

Following up on this thread since both the PCIe Lane Margining debugfs
series [1] and Krishna's bwctrl bandwidth scaling series [2] need a way to
temporarily keep ASPM states disabled and restore the link's configured
ASPM policy afterward without clobbering permanent quirk disables or
sysfs settings.

Manivannan, do you already have a v4 of this series in progress, or would
you be okay with me taking over and finishing the core PCI/ASPM patches
(while keeping the ath* driver conversions separate so they can land
afterward)?

If taking over makes sense, I'd like to align with Bjorn and Ilpo on the
API shape before writing the patches.  From the Oct 13-16 discussion and
Bjorn's recent bwctrl comment, leaving pci_disable_link_state() (one-way
quirk disables) and pci_enable_link_state() (init-time aspm_default setup
for vmd and pcie-qcom) unchanged avoids semantic conflicts for backports
and existing drivers, while adding a new per-state reference-counted
inhibit/uninhibit pair for temporary callers.  Sysfs writes would keep
their own disable bit per state so repeated sysfs writes cannot skew the
counter, and pcie_aspm_get_link() could accept both Downstream Ports and
child devices (along with moving the PCI-PM L1SS D0 transition from patch
3/8 into the shared path).  Alternatively, would you still prefer renaming
pci_enable_link_state() as Ilpo discussed earlier?

[1] https://lore.kernel.org/r/20261125-pcie-link-endpoints-v8-0-19d49c17c05f@google.com
[2] https://lore.kernel.org/r/20261119-bwscale-v6-1-9a9a715fcb46@oss.qualcomm.com

Thanks,
Priyank
