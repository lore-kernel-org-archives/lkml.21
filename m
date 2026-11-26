Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.166
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795671189;
	b=Kw/931Jof/PVb1BffemvnA726+6x9SYCZygsyLnxAI3fwfKM7MElSMzmy24LbzKfGKUj
	 pPNe01UW5OuQtaQjqv9DZUPBTQxAcdyyQt1uaVWyuiSsLUVAhidiXbByTSnJsjGty+Bb/
	 gUyyE6tWUtWhfuO/ep9PZrJNKEJyDns/4nN3KZ/dCeiKBhGjd2uK1lsEqZ2DHwMYKJc6P
	 aKlPD4tX61r+LRtN70GbGiA6DGt+918pgolJ2HOUbgDh64WGBLRqunWrG30pvaVJUI0Qo
	 1j5W4tCrpef7raDoi4+fKXabtCxHk0s7lkQsO0p0x9IY84k0HHZONCMaIiihaN4fQVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671189;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Subject:To:Cc:References:From:Organization:Message-ID:Date:
	 X-Mailer:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CGriERpqNkulcELAKAdEuvFTKnGo71JGt80ItgcyMds=;
	b=QphDymwIq5/gN9gtvR6xysbrUjRFebJIOpC2oq1pb7dmfKsr1ybkHYdaotQFSMZ6kkfH
	 a8r1A+XyzDuKjy3jb7fFW4sU/5I7ijVFYzlMMhK+F/hXnlGzXa96fmZM24hWKe/oHED+o
	 /EzL16us6eppqjTPrfaP6hMn0jc3cuohOwXR5KPImnhUTWWKUIhkmk8Pp9Pvj/9JFMqF2
	 ZrpMXuXqUtTpj0uEkb55NryhQDETAwxejuwrYFnpibclKFqjBKYHT/OopKB8HMjaG/Lf6
	 4B5S04LCEyY9iiRniKitoLAq7kxOu66nmYW9i33lnG3mwLCPuPcrk8jfbgDOHHsscOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xenosoft.de;
	spf=none smtp.mailfrom=xenosoft.de;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b="j/WcXE9X";
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=tuDt3qfc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.166
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B36F606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B36F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=j/WcXE9X;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=tuDt3qfc
ARC-Seal: i=1; a=rsa-sha256; t=1795671151; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=NGx2tA/FglNSe37qgaaVt8/onoZ2qESknVN0/LQMvkCui2p0XNO8thDn00E/eLd5AG
    jZ/AvxCTXUT6g8bmPDeM5uAvxrHouwoBuFpkD5G4wtIUcLiuOW06ZGsG3MLlgw4sVotA
    Zzp6z44l4JhSzGUBI1G26fGEhlkZ58ZwSeiSay79zH2gGuMWI75eWgf3Z/ncs0JGATkT
    uP219+ykG+YXUJ5Hd3jWmfvuF156CO+uvi5nNmuPovE5jlidcXiI2O5fGMCjyST8yFK7
    7BeKGvQMmNFSOQRzjhCNisYiWu4euepw+UOGEHLMS74byv5uK8FdrmyYJWlcmSDr/9M3
    GqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795671151;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=CGriERpqNkulcELAKAdEuvFTKnGo71JGt80ItgcyMds=;
    b=RHJPttzneIW6TN/zy+FRZ9q4lPoVHlcYJucofB3Z+C1qlYazMKFf3Wpqj2Qsyt3PCn
    yum8eBT5lEzuolzEd424ZIdTri/tuUdbY6Mqmmat5gIPr5ciCkPsYxuTMOHzQSTEFDEb
    nYA+WI9iEZkcgDNif4ZI/3GXhSoKbnE6YaeGejjnwcAJdntlxGDGzE0LYIvkOTBK6WP2
    daPazC7zO/Dq03sNFbvn4uPWID3ce3Kfa0nMzg9UPaR9rlZYJjcVcORmJEBnyy9J4c6y
    4n5BjyPEkLW6R5TXana5IsNUNEGWdN6hc83uT8i1Iiq/pPnajnVAoAuaUJNlBDXpvOxW
    vXPg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795671151;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=CGriERpqNkulcELAKAdEuvFTKnGo71JGt80ItgcyMds=;
    b=j/WcXE9X0bfzwWoSYbaFJ49etptrZM4nnFjR+ZgGptLXkZVh34qNe4rbqwa6iTdfjn
    HOtJP4TRCYW2hGaqn2igzbqX2f3r95jNApcyJDocLBqoqChbmFUPVcFGL5ax8lsTMY8F
    l2dIdcONOCCUK8NrfnmTvueHO8sy9EiDcwQVAWThbv8xvT2v6KMkuaJ7fK1aLV87bYje
    0nUZWsHqQo+KKOsI+7RCbxYNo/4j0o2UCddiZPCVAOqMi3KYVp9kMEjfvNzO4v4DczbB
    movZSsPyFstvwclfF25DU1vURkHsd+H/9l473lGu4W5LUAEv6kbAK6i8g5mm1hrItS/0
    wx1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795671151;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=CGriERpqNkulcELAKAdEuvFTKnGo71JGt80ItgcyMds=;
    b=tuDt3qfcL8eoWEdrYS3upxPqWhIOPEHAsITd1VnYWQifx8GJUbLfstaDnBi7WGd8oQ
    MpQOOCk4Ta/V5ibIQnCA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIi+t7nc="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.6.3 DYNA|AUTH)
    with ESMTPSA id e825d92AQ5WUhsM
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 26 Nov 2026 06:32:30 +0100 (CET)
Subject: Re: [PREEMPT] Kernel panic - not syncing: stack-protector: Kernel
 stack is corrupted
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
 Narayana Murty N <nnmlinux@linux.ibm.com>, maddy@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
 msuchanek@suse.de, harshpb@linux.ibm.com, gautam@linux.ibm.com,
 amachhiw@linux.ibm.com, venkat88@linux.ibm.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Damien Stewart <hypexed@yahoo.com.au>, Christian Zigotzky <info@xenosoft.de>
References: <D0ECD6B8-7F15-48C8-87A4-DFE5F35A42D8@xenosoft.de>
 <EEB13352-2FD9-4169-B709-FF7822AA591F@xenosoft.de>
 <298e965b-6de2-43b6-a6c0-e844b115438b@linux.ibm.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <51d298fc-6af2-380a-6ae1-05c0e674cc14@xenosoft.de>
Date: Thu, 26 Nov 2026 06:32:29 +0100
X-Mailer: BrassMonkey/35.0.2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <298e965b-6de2-43b6-a6c0-e844b115438b@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/26 09:50, Shrikanth Hegde wrote:
>
>
> On 11/25/26 2:16 PM, Christian Zigotzky wrote:
>> On 06 November 2026 at 07:09 am, Shrikanth Hegde wrote:
>>
>> Hi Christian.
>>
>> We had one known issue which michal had brought up.
>> Do you have tracing enabled or running a bpf/bcc program?
>>
>> - - -
>>
>> Yes, we have BPF and Tracing activated in the kernel config.
>>
>> Nemo kernel config: 
>> https://github.com/chzigotzky/kernels/blob/main/configs/x1000_defconfig
>>
>> Edit: I have deactivated tracing
>>
>> Link: https://github.com/chzigotzky/kernels/releases/tag/v7.4.0-rc4-3
>
> If possible, please share the logs. Lets see if it gives any clues. Is 
> it while system is idle
> or running some workload?

It occurs sporadically during workloads. Disabling tracing did not solve 
the issue.

Log: 
https://github.com/user-attachments/files/35445406/Nemo_kernel_preempt_with_stack_issue.log

Link to the bug report: https://github.com/chzigotzky/kernels/issues/22

-- Christian

-- 
Sent with BrassMonkey 35.0.2 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_35.0.2)

