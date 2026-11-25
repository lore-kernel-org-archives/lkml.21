Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629804;
	b=ET0O7yArGa4YI3wyt9YlCvnBZDzjHH5IGrE0nQPlyZlLGRmusyw+xiXui24U1x4Vvaj+
	 qZzF+g50Hz2+IOSmKmniC95dXuLKEw1Rmxznx70kVxDyKrg855i14Ki4Fl7IQo2RIwa+s
	 iv6/2gUSBxbRoR/+UmIyeyDF1WHg4/KTAr9yp+Ix9A0ngA7fU/70UXoT6GONkcjzROHX3
	 LKGsCji+47Xgfl8PaacdQeBGrQcpqAaekd5pvVv1BxBpUltnq6G5Lat2U/wFbu7ak9+lh
	 hyxN+uNIgkPlgGCaJRTbrWE1BDfr5CiRbaOEXSrastP1wL5BYg4o3Dm8hAVwTUV8rzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=X+1AYy7Mp2a7SBL4ePYq/G5iDJIRCdCJCue8L7l5f3k=;
	b=boR7TZXD97cS0K1J1PsvBgGeLhZyISrPyEG/1pd2F3uY6ZiiHnUnchp+c/Vjfuk4ygyr
	 Vi6oHeURipzSSH7RHN8DeV/2SdGtBCLwH8IdshUWPb+XycYjvW9yL4M5DiorFUzFMW2oQ
	 tNVNuhgznxUe1GDNwKuwU72JofMOiRhHIbq0BHa67IncmcQkeOs5w5Zl4SPec8YBGLOdm
	 7bPkG6parmMDZ5BRrEFbxbkqI8KTft5C3A8nsKaqBxNb7Jlq9khkD8FTEL2GogfGKwT+a
	 tqoj5ckyMLxv9TvRHYp/mnUSaDOn10FyXQxIBH4GHA+e1P7N6ZsshcKihhFSBUZY18w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A95H94SU;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9BA606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F9BA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A95H94SU
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f04b676219so34355855ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795629804; x=1796234604; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X+1AYy7Mp2a7SBL4ePYq/G5iDJIRCdCJCue8L7l5f3k=;
        b=A95H94SU9aU41X9Qdw1IDB9XFy9sE+pVMkssDqz5UP6xSP3vg85yutqk/5Ml20CrFx
         8csRNqN1wMi5HgLKS+Za1S6ObBSTEG16G5Wadl0S/zdF+vZuNph+oXSFiv5qjvVqsHCs
         /+QNk36QzE0ZAeuPGsRdGF5/vNYWdE5/DNEYfiPVfRivzQTnSlIiQfpXE+6Nq6HLZQD3
         I726J+6XoLyFWiRRWW1cLvOUnTi4MsweX+FHvrqFfe2XJ9ihDPu8JNrm9da3ym2IIWq1
         QfQY75kYGmaA/GkOicVMnxrkmTt6nz3SpYVpXZRuI34K+WOMApV1T46NwXAed7AlVt8h
         lqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629804; x=1796234604;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+1AYy7Mp2a7SBL4ePYq/G5iDJIRCdCJCue8L7l5f3k=;
        b=tDOLGo8Ke4XHZH5ZGk897LgJJ9AdovCoikSJZy1X6Qn5aG7y4sNC6g/g7MQC4hHwPq
         O/kvuSmcfJfZ2/BotmVQelVe3s2t0EAiZ+3xJpTZyB9ysagNWA8vv1A4oqQL9lm2IvFA
         9hhSrwLEvKscGPTQ1pdD/QIdjX1Xer2KmrxDl5Nd004Sf8Iqb8pE9Qt3zxCoqoMePntU
         pETiiZUTU8nu5RTFeCoUzerTzQY/PBAyr83AekKEWluBf/xeRr7lSyihIV0ZpbsoETLW
         wDf6d2XkN5YygBBy422E4bQREpch3XKsDYsAei3YmEh0poZ+b2Id4fb/s/TE7oY2KXZZ
         ZLHA==
X-Forwarded-Encrypted: i=1; AL+hErGZTN+iFk0Wf2SD1DAnRogHcWw/rbOxZWBYwePtFrSJxCPPsAu/9KDbRBwhbpp+eEll94RkAHMg+PypqcI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eo3gtMa1uhf5B1/u6duLGQk1nNuURXdYxPbE8qtauUSUmeuDC
	8Q9V+qX9s5nQx/gqbOBzwPNMRXWJjJLskHdsoSWuqnEZuv0NgNrHKYpWOLIvhIydug==
X-Gm-Gg: AZFdTZev11OUuM0sPhXeRdBK4ZwJ7HMneDUqT9z+qsTVeTQJvd7tCvzwTnaxyONWL9l
	bZo1aWKRsWWNI1/7RGOqNgD38+KTom0B9WQcIg/tlJTudYGpHALdPOqIhNz5bWI2w3DMta+8/Zj
	kH/m5B5N6ollqk9w3+tSnijV/cvc0Q1S0Cu+/Mj+LpK6e0gSnEtD8r1WqpT1tcWkJ5MFuZ/sjdu
	ldIW4fyNaiFDgUzIEVQz8klTG5T4TCAfc1NQhiAK6zzhBkWLGwcCoj6ZpTMjwixT65/AwBGsDmK
	1RXG3TKK1GdLwANxhYUBj+XG3lwP9aFmJBoYKnz37awzkG9BpqMkZlxIrPs8atAqmqBeNIc/7+s
	jOkIv21Ej9EN2yaOhFfGDBsV4zIgB8bV6Ygd3Lc5urtAjqKKztSG5/bXo0HHIgs/mjs3Lh3MkPW
	toEJoU1mEhWuTZ7BHUgFEI4ojFt0SJeZRCzWJdSc8jrysIFbtPw/hKK8hY2IN8FOA0/PcQSmf3I
	fS7RLHqmLDQamMcYtwYYcHuTAp6hTn1vGX1rY5NfWH3cEEbZ+vx6gKRDHtD9wOrNLFLMU/6vN1t
	cCS3B/OL3hRSxLm6Id0/u7lasWohnJmna1NIB1fz8ALTcbZPFF2JuGJTzzGsANZbeA==
X-Received: by 2002:a17:902:f54c:b0:2e8:9820:80cf with SMTP id d9443c01a7336-2f03f1cfbe5mr188390265ad.58.1795629802894;
        Wed, 25 Nov 2026 10:03:22 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm91361725ad.75.2026.11.25.10.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:03:21 -0800 (PST)
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
Date: Wed, 25 Nov 2026 10:03:21 -0800
Message-Id: <DN4HN2W6ZVES.289H6BZD9U7KB@google.com>
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, "David Matlack"
 <dmatlack@google.com>
Cc: <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <graf@amazon.com>, <jacob.pan@linux.microsoft.com>, <jgg@nvidia.com>,
 <jgg@ziepe.ca>, <jrhilke@google.com>, <julianr@linux.ibm.com>,
 <kees@kernel.org>, <kevin.tian@intel.com>, <leon@kernel.org>,
 <leonro@nvidia.com>, <lukas@wunner.de>, <mattev@meta.com>,
 <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 07/27] vfio/pci: Preserve vfio-pci device files
 across Live Update
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-8-vipinsh@google.com> <auzftbPFO_6XBYVw@google.com>
 <20261117220059.GA2250529.vipinsh@google.com>
 <DMZLLYOVIGOU.1RXWYJN6UQTM@google.com>
 <20261124234830.GB3545683.vipinsh@google.com>
In-Reply-To: <20261124234830.GB3545683.vipinsh@google.com>

On Tue Nov 24, 2026 at 4:22 PM PST, Vipin Sharma wrote:
> On Thu, Nov 19, 2026 at 04:06:38PM -0800, David Matlack wrote:
>> The incoming kernel computes its own virt[] and write[] masks and
>> requires both to match exactly with what's in vfio_pci_core_device_ser,
>> otherwise it fails the retrieve. On take-over it uses the preserved
>> value for bits in virt and its own freshly initialized value for the
>> rest, like your option 1.
>
> For now, we will be rejecting any changes and in future when we add
> userspace opt-in mechanism then we can loosen this check, am I right?

Yes, any difference fails the retrieve.

I don't think the opt-in would loosen the check. What changes is the
masks the incoming kernel expects: it builds its emulation for the
device with the opt-in bits recorded in struct vfio_pci_core_device_ser,
so a device that opted in to new emulation still matches. Devices that
didn't opt in get the baseline emulation and keep matching older
kernels.

Separately, if we later find specific differences that are safe to
accept (e.g. a newer kernel allowing writes to a bit that used to be
read-only), we could relax the comparison for those. But that's
independent of the opt-in.
