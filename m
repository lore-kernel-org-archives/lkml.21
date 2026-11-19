Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.190
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092257;
	b=uPLJHadFS8/FW23iqzj8/srYjf8Hg4Vhi6KkJsVfVzVwgk2QgW5nmroR4Vdl/EyxdQzG
	 b2oprp8s3TaO4cYlscR1zmuUgMp3DcdqPo4P6FW0J7SqPMBwgnmA3lvcsfhn3JJpwJmbr
	 USO7bRYb8nZURbWgmC6W8EjeZ9KTQMaHJMtrF/IxlN6XwRUZLHeD1gCqZifjLi7AkFvsw
	 OBLnXL+4xguVS8a92qbpy5dDcRIIijkzDknQ5q8ZQXW2yT6ToA8/DZI7P7hQSf6+R9il4
	 xfQQpoXIiUSD9+BqRJk4kDZ4xuI2ePWMYue+SRsSlPHmPbp8QihGQOGdW2IxWakGoMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092257;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=odGKjtuO2fcSEp2Bw94sYra7hu3Cvd+3dwpUXKWdflc=;
	b=Bf00hjN7Rknk0kz9e35tqaE8PrkhID8w7kGz2bugQpZQLxWfP8YERTiUibowZo8hOzSx
	 UweAuBXVCJOWbDzSu/J9zsbZWvBpYrmxQhV3GpRmSKvKQXJrtmOEqMljgxBBwTnoC92nE
	 TLGLgwOW1/bQW7fvnG/kL34QZRgr23YibeEsS6YMoj6IOyBmDadcmvx3sHgbAGFWPV4PX
	 32Oa5T8mJUyGQ/kDbvdE+3I+8etJA7a+DT3GuRQKlTwaurB+LHdTZ7dvdGbAw3Zdfyex0
	 MlV/ZcWkl6DgDdMbQSBUBflmeABf1vNXW/YyPklyekxu13Kk0wenibwpAfD0KBLKZ8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Xm5K9aUy;
	arc=none smtp.remote-ip=95.215.58.190
Received: from mta1.migadu.com (out-190.mta1.migadu.com [95.215.58.190])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6748F60A262F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6748F60A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Xm5K9aUy
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=odGKjtuO2fcSEp2Bw94sYra7hu3Cvd+3dwpUXKWdflc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795092254; v=1; x=1795697054;
 b=Xm5K9aUypliUEN5W5tlLqwSvf5vjzoa3e/CT6q1LEZa5hLPqMRcmR9ayLYTJBsZsnapm+m2S
 23fByICux5qIvvIPrFRC21cniwWgGgHef4Mts/CijyVMTpMPjMplYXRcDz2SvIt2MGOeDB/Dw9j
 rOnsSNri/aFkuDWngWhVsj4w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 469e91f0c4d020cd;
	Thu, 19 Nov 2026 12:44:14 +0000
X-Mizu-Trace-ID: 469e91f0c4d020cd
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be58ad9600so8107e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:44:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFDFPGFM9pu62jP2BsZF7Rycldy2w2nAHud6wJZocG3+DA5BY/Je73wn7D4EAQhB313JId+DE2a1hk7as8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1F2ymxSqSqHcwbut2YxaxtxojDRhlWP9P4UMQ7K4czRJ0UQpC
	5RYbVCl+9FnBHBr2/XEHZqF9KxImdfZhrY3vucsXs3/+lbX/4IMVbqS8Hc7XmtZzNohV81xu3zZ
	lHLoQMqiK/3hMFuYAn0wi/L12SDYdV7ZsckJNRJZV
X-Received: by 2002:a05:6512:4011:b0:5c1:4d61:20ff with SMTP id
 2adb3069b0e04-5c1b6774040mr72185e87.10.1795092249237; Thu, 19 Nov 2026
 04:44:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117074428.7544-1-fuad.tabba@linux.dev> <20261117074428.7544-2-fuad.tabba@linux.dev>
 <avxfgWNePsGPK9mm@gremlin> <CA+EHjTzUrDxLSMEo6X66XhKtQ-=ew3zZhMdFWR6U9Ga17WLWkw@mail.gmail.com>
 <av5CBjbeidUUWiLq@seanjc-mac.roam.internal> <av7bYb1geEGzaj8e@gremlin>
In-Reply-To: <av7bYb1geEGzaj8e@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 19 Nov 2026 12:43:32 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwzdsMKw2MFB9kpV=Xtm4JFpTbWRn0BOSwSB+x=RJhVMA@mail.gmail.com>
X-Gm-Features: AclHuK9ExBlvjAlpEcQpW7OIX1pR4w0klOAvsUXwgDHyVbn5Bw8uFWJCaQ8SOYE
Message-ID: <CA+EHjTwzdsMKw2MFB9kpV=Xtm4JFpTbWRn0BOSwSB+x=RJhVMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's
 dirty ring is full
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Thu, 19 Nov 2026 11:18:48 +0000, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
[...]
> > > (note that it skips CSR, SBI also with a changed exit_reason).
> >
> > Ack.
>
> Probably worth referencing in commit msg I guess?

Will add one in v3.

Cheers,
/fuad
