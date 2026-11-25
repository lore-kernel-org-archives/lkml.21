Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795593114;
	b=KMBFrLOGpov/Jha2+mrJNteAjavoz2DECVdq6QXCyiQekMs/Btx0HSQyriPNwOPn/OLo
	 /owLExeB1v3YbQivcTQskqHtFM57vIOip1JzVC+jVrYA8ZMQ8nmh1baMOyERwm6l6DbFD
	 /S2nI0FXxGFH/qzS7Cx//Fxw4z3GyibvyUTBR59lFoctkJcwKQCMxtj8OavX8W3hDJNVx
	 drodU+FNK5zywsu1sxejtygWObQElgN/eC60Df1t7GGd65CzY1by92SPc1mLcA1Mvar29
	 a0QS34Rppv5LDTenRll8EPayGAqerrGgycQyn1tdifwByCxZs59pre+U+Fto0jK7y5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Jvc6T0hsHWXffEvQKNFhCmtcAcfBWvvbJSXZbmwAzQQ=;
	b=NFTcD0NluNnAX6PUnbajfLcZiPPz0TVyXo8dIkazMZdtSZOxNPWbWUgKH1R5Qx0Wr3Q0
	 kV5/xRqEJupIUJX19ZelZZeRQTnL1jca+tWl/F+P3p7kbdI45X+tZ+SHfv5V4PbhIvGkZ
	 vJsOcRAVSTxNSEhkA4UbUtAmbBByrcd1XDiVVOVXpfqKaEm6Tpsz1r/wS/pyZXB1WhLyq
	 J24y7NHZmE1qk3iOX3D5WwMBVcbt+iMJhJ7W2KaaazYKP9ZkX+eOCHiLbUyDTYVFEzAEj
	 GBF7xCtneV3HRCNPHMDoCSZRDRBjZvnUv5esGxc44D9oQBY9JJl3jeigmCyKPYofOkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jvPW46IX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E4C606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9E4C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jvPW46IX
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso6362075a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:51:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795593112; cv=none;
        d=google.com; s=arc-20260327;
        b=AD9nPZGVAESzF9CKrc3yd/6rwQDKKnA4TXPQBy9v8i7HCte6W0TxSZx5f92Mzv0fFU
         g+XvaaA4y2rzBG1XV9087CQTJJ4q6fT01KDgyFRFhJbkIuRpSINjY+oClD+f7NGlTkMt
         XXSAcgbcmNNS+7JoH/v4bstIedt/X+c38i9rGzcnmi4ymnmUxHbhMDsU73iU96pF1hh3
         +FdlDmei3rEzfS9AXjo22r8RR0nnmRzAlsWgadj6bbHO2N5S7i0ygtqFGXZAFF/HtV7/
         USzD77mVreKxkS4POYPGWqa4+OCZoNKNAUtKIvDuVTl3FceNDIUGJ/74uH48RTpCf9Rm
         r5+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jvc6T0hsHWXffEvQKNFhCmtcAcfBWvvbJSXZbmwAzQQ=;
        fh=XsYTi0bzfwAaS0kVvWqnF6ci4YR2b2EimTSr5h4eSJ4=;
        b=jqXAcookL6oe8bDkvLaYfzU8rtX8LlG6ELEBjQz8GbQY3Qc93Xii05bl1734qbqBON
         v7OUGNXqWh9+/AAoAjA02d9ivDvu/Az0hdXY9IrT1mnBIKBFCCZtAoWoB+Swz4gd8dEC
         +onDxDAbw/nFrpUIG0eHd4WNsJPk5axYwWIOSZvQhSO3ykDUsWnbg8/kvf+N5lxQ1ny/
         8QL1xw22YJNWdR2wbYSz1UZuA3uuH8LM8kaX3DLVxu1GM3gxuGTX281Efzm+btwk+Jqc
         x4MLLB/xGTuDd2gGmhqNIyFHxWhDmfuIqJXStujz8alWXVxHV3Hb87H1aQSyIwqhgPoC
         ftoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795593112; x=1796197912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jvc6T0hsHWXffEvQKNFhCmtcAcfBWvvbJSXZbmwAzQQ=;
        b=jvPW46IX5TxDfI7JaifihWxwTJLYErkO3sPQAmCltLPjLJAnZpIv00NI7/qrDOWTh9
         ojG6Cmm0bzb9FmcHX9grhUCZPIIocpvtsUQ9bc8WyqTl4ZdzjkmOLHrbp5J2CLT6PBkz
         ToX2FZhbNnVS0JWwMvk1z4SlIcsRwa/mgH5iR6LkhQbOcX2gFEMNQN/8RI/yMWDFr3Uo
         pzvUSuwNUUACuTQmeydQXiGFNbsWWoy4WabRpGQYwTvFq+o7mBTsWn97CgIPoR88b15b
         k0+uu0hTtmtMYug12Iz/b+p3a3osxVz9CyMzggkpVB95xINI9PSY2ewL+yveLSnBDDU9
         YmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593112; x=1796197912;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jvc6T0hsHWXffEvQKNFhCmtcAcfBWvvbJSXZbmwAzQQ=;
        b=fsdThh14MFdwIqyVU/P9Am9Y6EprHU6oHiKDfxm/hwU6VQ5Uk3q67F5TN0NorGpMUU
         c3nngRo9yh5Ds9H7ZnKVTGJmXGRSuhLg0u28ANurWNpca12rZlxyc9mpUuboU9RKbDfa
         1Mc3XT/LpX7iouHUgnUAzjuI7vqb8MO1EGwQQJOmjPCgy4EQ5c1NuinX2sX8RItqt5hB
         yxBKt9NmSQ/LivX6CIPE2ncnr66P71k3H2W0YmwBX5qFZ8XKqkEYzDel8kO7uciQpkph
         lim/vxHbTcwzFK2x3j2OYM21SCSs0PEpRTASBncMDuIDWmzOC1IWPwwRujamwIqNq9eP
         WRtg==
X-Forwarded-Encrypted: i=1; AL+hErEhe3ff6FD+d0lodxy1ikQomfY1lIuc3rkpOrpOa+OL0s36Wx7VMseJZcyOgwQjH/Ewh+IEFyQ7uXXxSE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i6HCm3c8sZwTvxi44P8xRsn9ijUcNNM6lLmnHR+8K/syiXjUt
	br0gE6FgoF991sQkXzg/iYPgWG0yn9Ct0vpV+nLUmhWN+Y6sDYW6Kc/dSKW23FDbc46mpGoUrhh
	uIdBNrGmcctStQCrizcUiU+dcnJZmzqECFQYapDwn4A==
X-Gm-Gg: AZFdTZcH/QZwPrZD2YmGHOh8nzGteHfx7Ju14WQ1HnQHgB1zqjy8S+IXPjGOWhtN+0S
	oryCX653ZHudjBBVeC0FeZq3WjN1V2wqpqW4M6VSDlAH7QWOY8sl/qlmCu6iWyfVqMFDpTxKSPq
	otz8z9lUZAYBej4Bfij8rKreWc5YTPJoH2ph+jVKy7U+WsAipZ8CBfpnlxOGVa3ZZT7Nz1T1j/s
	k4DtRDuL+dI23QNwQS42F/TPwfqs7tOa9BB80dDKqiXHpNSgITSRLp9G4yRg3NDnqj9pHR1f/qo
	jbm+g2qWb84EHgutvtb5pjxR50FSmmw2hcPJNd7m5CGPIegS2oidV4YISGjdBcuJCUtB94vouIU
	jVol0EsQjYlGIu/G8zP/Go95EC2aUg34lbDkuVMdbRe7wgHShTLFTQ4fFdBC8inL0IH+E
X-Received: by 2002:a05:6402:c88e:20b0:6b8:854:da16 with SMTP id
 4fb4d7f45d1cf-6bae6cc26f1mr3051170a12.18.1795593112101; Tue, 24 Nov 2026
 23:51:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM>
 <awWOCejxtjP12xFX@gpd4> <ce38fb8b-94d7-48ba-93bb-3b72cfcb3e61@amd.com>
In-Reply-To: <ce38fb8b-94d7-48ba-93bb-3b72cfcb3e61@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 25 Nov 2026 08:51:39 +0100
X-Gm-Features: Aa3M54rR6ZVPUahJy75241j29uSb7ZkPGUY3AC_gpwVLxdzpj7tWpPJ6cpSau0Y
Message-ID: <CAKfTPtCudy4NV8sU+JWE=dcJpbKd+LVNZPZztU_0nD1a04Ca9g@mail.gmail.com>
Subject: Re: [REGRESSION] sched/fair: SIS_UTIL limit in select_idle_capacity()
 leaves busy tasks on little CPUs while big CPUs are idle
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Andrea Righi <arighi@nvidia.com>, James Buck <jbuck2005.linux@outlook.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Valentin Schneider <vschneid@redhat.com>, Usama Arif <usama.arif@linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Nov 2026 at 03:53, K Prateek Nayak <kprateek.nayak@amd.com> wrot=
e:
>
> Hello Andrea,
>
> On 11/24/2026 6:45 PM, Andrea Righi wrote:
> > Hi James,
> >
> > On Tue, Nov 24, 2026 at 11:56:52AM +0000, James Buck wrote:
> >> Hi,
> >>
> >> Since commit 61ea17a63719 ("sched/fair: Add SIS_UTIL support to select=
_idle_capacity()"), first in v7.2, CPU-bound multi-threaded work on my big.=
LITTLE arm64 board runs 12-19% slower than on v7.1 and earlier, because wak=
ing threads are placed on idle little CPUs while idle big CPUs are never lo=
oked at.
> >>
> >> Turning SIS_UTIL off at runtime restores the old speed. select_idle_ca=
pacity() and update_idle_cpu_scan() are unchanged in v7.4-rc4, so I expect =
mainline to behave the same.
> >
> > A related regression from the same commit was reported by Usama here:
> > https://lore.kernel.org/r/20261113153157.2495664-1-usama.arif@linux.dev=
/
> >
> > On Grace, a zero SIS_UTIL budget skips the search despite suitable CPUs
> > being idle. Your case shows that a nonzero budget can stop the scan
> > before reaching an idle big CPU.
> >
> > We've discussed a minimum scan budget and accounting for idle CPU
> > availability, though a small minimum alone may not fix your case.
>
> This had problems in the past when Chenyu was iterating on SIS_UTIL
> where the search opportunity at higher utilization is actually very
> low and cutting off search for !idle core was beneficial for SMT
> systems.
>
> Now, for systems without SMT, it has its benefits too but a system
> without SMT should be equivalent to a SMT one where test_idle_core()
> returns true always if an idle CPU is present.
>
> So I'm wondering if {set,test}_idle_cores() can be extended !SMT
> to act like a gating indicator to say if an idle core exists or
> not much like how !get_rd_overloaded(this_rq->rd) serves as a
> gate for newidle balance - it can be flipped to true when a CPU
> goes idle or if load balancer sees an idle CPU. Thoughts?

I tested idle_cores tracking for !SMT and EAS months ago [1]
[1] https://lore.kernel.org/all/20251202181242.1536213-6-vincent.guittot@li=
naro.org/

>
> > Given both reports, reverting the commit seems the safest thing to do
> > for now. That would restore the previous asym search behavior and we ca=
n
> > revisit a better consistent strategy to cover both sym and asym CPU
> > selection later.
> >
> > Prateek, Vincent, what do you think?
>
> IMO it still makes sense for SMT systems since capacity on systems
> with SMT only makes sense if the entire core is idle and then it is
> just a best effort thing right?
>
> set_idle_cores(), would flip the flag as soon as an idle core is
> available and after that SIS_UTIL is bypassed. I don't think the
> SIS_UTIL cut-off for non-SMT ASYM_CAPACITY systems makes that much
> sense given misfit penalty is much higher.

In fact that depends on the number of CPUs in your LLC.
The current SIS_UTIL is unfair for small system because you skip the
loop with "low" utilization:
- with 12 cores per LLC, you skip the loop if the avg utilization per
cpu is above 839 whereas it also means that you have the compute
capacity of more than 2 CPUs that is not used and util_est can worse
the situation
- but with 64 cores LLC, you still tries 5 CPUs for the same avg
utilization per CPU
- and with 12864 cores LLC, it's 10 CPUs


>
> --
> Thanks and Regards,
> Prateek
>
