Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453096;
	b=WDlcxD4oE2F44sy0y/3BfxMzV20DeMRyIwN5LcTINZForlygRZPSDZ6YBzlp6BzQTvOU
	 Dd32OpFKLUiLaxSWuJsEJmMN6kIWtXMHsu0bNkRVcuDkNPUJLPPC2gTOLdQOLkcTVzAoa
	 pCm9Yv5EHKKYvN7r/21VuAs3NtX1sGHzTZIgUaqXejut4AIb7vwXMkXS5rf64xh7ctUbV
	 y14JPjy6IR4xSPTfUU9bWq6rZYBNh6NQ9SqIfMyiF+vBmKanGtIIH0c1f7cuG/Ig2Zjrz
	 pGOZj9lxux8b0r/ZNoe4Iigb8oVWLnjtQ1z2dRmAwS36I6HtE+ddxrLaSVSqzwwufWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=k8jKBIfQ5nNOWQOY+LEVg9HBdFbaaXrpreLqMbfabtk=;
	b=4kdpr6m+evI0VeSO/7ttHWoilgLUoXLo4Bt/bmu4e151/swIPaCauZpYR+DXagJ2qJct
	 UA7p4dlaU7f8C6BMSNBsXvd31HTBP90ct4CcuQqD9Bb1alPB+07VhHuhuSyfTlzCHeJSj
	 lQUIV8nx4N/KBS21oZs/zs7xHnfGcyUJ0Y+OfkcXZA4EXzZnt2sVQoffa9cU0ghNVGpMD
	 PuKYm4ccKgr16oRQ+4b2R7Da9ccDY4/vAP7NvRNyZSGLdUkvpW7PjtPyiHXgBZXwkLS7u
	 /hnII/G3n9tAigBBHuhwxP0+/neO/DcxWWvoFTqsHR4gTplTMXEoTA8AwgjAnGTr6uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XGaOmIX6;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83E5606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C83E5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XGaOmIX6
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b6463f95a4so2958562b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795453095; x=1796057895; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8jKBIfQ5nNOWQOY+LEVg9HBdFbaaXrpreLqMbfabtk=;
        b=XGaOmIX6sapnbuOR1qSaGlE5t4IfnSGWJp4HhaLRoLFyeMPebugeddMUH4tbJ/1MDM
         ufIG7W71JFr1rF2cdLU8pPhYHbDguMGBWqQOikdBGkz9juKpW/SmH552WXapRw3F5m9R
         UUIBDLaKKcTFHdl7T5JL8OOr7dmTXY1vb8uLWWqp9DR95LtVVFOPYRjVtAK6158447yj
         gVQbFNN7NMZWPHOGsmHbTRZ2WaaA5lGs/yqpUo3NfuYX3vd7x06zwvrxoZpFXhgvfgal
         e1zh755cMHmTR3K/w7UVJMvZtP56zrrcLhmAbEJPynA19k5Zh3V1nvk+Y0CaEWX1O9Fl
         i09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453095; x=1796057895;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8jKBIfQ5nNOWQOY+LEVg9HBdFbaaXrpreLqMbfabtk=;
        b=1hD4FubX5EpsYH84RaULz21GQfc4Y1Z+0Y6c4mtq3MTQSXarZSF+s+qaBgL9Rj/pt4
         Oj5SiATT1tVFpfw/GvYBRcfs44zgy1tc4zeYGOYaDw5vY3qUZm9dgpZ8XWuuDtlhEyxB
         TkBHWVMHgH7jEgAe1u/KHqpMPSh1hFDmJ9J93sgR7/RIhpY1L+7xKFQn6zs1Sb7MUsku
         ATHHUzgkyfTbAE84M2VGHwUQV+vnctcFCWKVMHztjytqSjbnrq4/XQ3LStuZ09r97ijK
         2jN5wu7fuY1Z2J3YvJujiVs4ytVMCoxAOZfScNie6ybq3zmv/cVrTiDpj8aUEGArMYSE
         rMHQ==
X-Forwarded-Encrypted: i=1; AL+hErGrrH0oQt8d2hmfqKh8U59M/Mg+CEYaaI8sGVQYX7TwiehbHzMgDzziNeSgahE7tTCbhC0LQQgCnmLedGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rpwmhi8oIxujRR33dIQWXfos3xSy2uey9Q5sJRzmA4+wnOfq3
	/WDFuEYtbJbsCLr6lI5+dawSFpllbfaJpIVpRMoKah25BqHWwUTgmhnT4xjr3BJz1/+evv7Ir5i
	CwiQG19yq13REg97CcHGu9YIT8xHZas5tug==
X-Received: from pfbfi7.prod.google.com ([2002:a05:6a00:3987:b0:8a0:91b7:e7b9])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:2589:b0:3f9:797f:3869 with SMTP id adf61e73a8af0-4014d359938mr11683499637.47.1795453094794;
 Mon, 23 Nov 2026 08:58:14 -0800 (PST)
Date: Mon, 23 Nov 2026 16:58:13 +0000
In-Reply-To: <20261109215704.1852183-1-rathodpriyank@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012-fix-aer-mask-override-v1-0-49a0d7aeaea0@google.com>
 <20261012-fix-aer-mask-override-v1-1-49a0d7aeaea0@google.com>
 <20261027230853.GA519764@bhelgaas> <20261028173038.292999-1-rathodpriyank@google.com>
 <20261109215704.1852183-1-rathodpriyank@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123165814.421924-1-rathodpriyank@google.com>
Subject: Re: [PATCH 1/2] PCI/AER: Make aer_mask_override effective for
 injected errors
From: Priyank Rathod <rathodpriyank@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lukas@wunner.de, 
	sathyanarayanan.kuppuswamy@linux.intel.com, ilpo.jarvinen@linux.intel.com, 
	dave.jiang@intel.com, prarit@redhat.com, ying.huang@linux.alibaba.com, 
	terry.bowman@amd.com, corbet@lwn.net, jic23@kernel.org, 
	danielmaraboo@gmail.com, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 09, 2026 at 09:57:04PM +0000, Priyank Rathod wrote:
> On Wed, Oct 28, 2026 at 05:30:38PM +0000, Priyank Rathod wrote:
> > Good point, thank you.  Would a shorter commit log like the following
> > look better to you?
> >
> >   aer_mask_override=1 is supposed to allow injecting masked errors, but
> >   aer_inject() corrupts the hardware Mask registers with "&= !" and
> >   restores them before irq_inject_interrupt(), so aer_isr() still drops
> >   the error as masked.  Emulate aer_mask_override in config space reads
> >   and writes instead of modifying the hardware Mask registers, and
> >   document the parameter with MODULE_PARM_DESC().
> >
> > I am happy to send a v2 with this updated commit message, unless you
> > prefer to adjust it directly when applying.
>
> Hi Bjorn,
>
> Gentle ping on this series now that v7.4-rc1 is out (both patches still
> apply cleanly to v7.4-rc1 and pci/next).
>
> Please let me know if the shorter commit description above looks good to
> fold in when applying, or if you would prefer that I post a v2.

Hi Bjorn,

Following up gently on this 2-patch series -- both patches still apply
cleanly on top of the updated pci/aer and pci/next branches.

Please let me know if the shorter commit description above looks good to
fold in when applying, or if you would prefer that I post a v2.

Thanks,
Priyank
