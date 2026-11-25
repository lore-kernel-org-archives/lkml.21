Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795580925;
	b=3x6Y/kcX2vrnUJf92lBblmJe1FsGiQ8MSDLgvc7/5w67urJ3/oJ4skHBlFZUxtiJznFd
	 0QZ3QGQFiuiFtqZm11mP6BGOM8AJAh5HVcp4ugXO5AKJhBo61Llz7fna5HA4Kc8yWc9Rc
	 az2if7bfoSbi5RjzZ8l9U3VUVgwHPGqi3Q2GdCMqP7mSYclg/NZqG+n4SGtrsdOw6BwQH
	 3Wh3YtrR/tcd1IDMdUAYlERbDLiYsBcw2JSfhBgmnQvh0yxWfNwmO9bygDcp+q4gQMF3R
	 nf6/hPkA+fhxtSOxMVqgdUUghIFDdGJqhxHUH7ilN+umQ5IisMsyKb+aw8JEiVp8mhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580925;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dKY3aMlMyjK1lC+5eKZ7v8mVUXG2wOl+AF1hgE7RVI8=;
	b=tyKNbdw6gv5NPhmUlMzp/tP1G5oVh6/aJdUrk9efzrg0S59nYz0bFVYOsorJDjvsff1k
	 sB9kK0LJkZ3RPaqnlj7BJg6yjvRHqSlEpGTdaG4r7axpQagPNnOo1COXPTFeP1Ecc56Qy
	 9AddKTCYf5lr91IfHyft5b3VP/vyYoiRvH56e8Tg6146Segm/UFPJfe0U2f+5S4lUvlFk
	 3mrw0iHR2Q558eTmxdoBSdRuXzBvf7QEngpXvPnWhEUEJxIdxn0pN+sWxOzDNvKI/fzYg
	 jcF3BppX1sq5ySh1BVFhpcZ9rb0sSdYbftWvONAUhwjOkX24Of9DDWHUq7sy/g4GIug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xenosoft.de;
	spf=none smtp.mailfrom=xenosoft.de;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=lQsjlRNx;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=DESbxEjC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.52
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFD5606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AFD5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=lQsjlRNx;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=DESbxEjC
ARC-Seal: i=1; a=rsa-sha256; t=1795580898; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=kjobU1oXsg4GpRsg3AGau8PIQhHixU83PRwOf9fLqAJuHvBSRkSFNCqxCTzDIot/pu
    qePVX2iu7hfCMK8BWzrY8RqhDroyfnukCwDfK6bKT1V9U1Yy5HHAX60ViPGMHq7u/n6b
    WKVdvgzNZCrxbJ9VZFUvSSRrFfzxP/P7StudSXR/XuhAVCI92zDNmQzPrwzP9vgsFomm
    oLWaQfs6ppz4MyhmocE+6sn3KEscMiqn2Kq5FcvDjSHyAiJuIoBZauzznTOwCkohhFco
    xmxH+u9LbcFn6yL+bn21DzyPXi6HbqiRB9QvE/RV4x9807r7Kk052WKHuwU3BqebP2AG
    o+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795580898;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=dKY3aMlMyjK1lC+5eKZ7v8mVUXG2wOl+AF1hgE7RVI8=;
    b=Yd4/2Azv7qnohf8VMZgRvKmZMrCmS6Q4jqAq9StRgpqX+GF7C9Mek3p2YqOKmVn2al
    wM/SIxI1hGdzuxikxEui4u4XxIRHAdwN92GxdeEzmpSfz6Xo/ivJhAVxK6mYwIdpC7Xx
    DOLIUkEoE/38GZUpxOcJEH81jYbiyxifuPaBqHOG1W2sVXlvcgl+8OzVICyMCELQJd0l
    R3mZcJkThoGhWvjzQXEnttpGUNZmZ4vQP/unhBlA4we3fi092shlOaiXhaSKFOzjRVE5
    ZxOjk7OIEYMT0BeYoZ0ieXR7MI2wBFnbjXYq4HJXeY5Q7VxADGmKuIDP0M7oJJ0TW1af
    f5tA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795580898;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=dKY3aMlMyjK1lC+5eKZ7v8mVUXG2wOl+AF1hgE7RVI8=;
    b=lQsjlRNxvi5tDXBZrIP0WMV/+cT2yWrnjVRgANtt2bH6DVmcdXND1OHW3UONv5w6hn
    X9e50maBIn4tGGGFT82AIZKmUTuUK7wTTibIw4G1MzqbsOWPPg7Zk7um8+Jr4pZmCp5a
    4QuEJqlwrzoL3l7rbSznCEYaMx32mVQQEU5xCmOkfnElYiwdJBKUXH8nKhDx2iv2lR3+
    Vmc9zEDsjEWJyDIq2ZYiElq2yUKu4oxUAyu13P4WLoaR4ZbNVfCLRLG+qZdqeDsXVWUQ
    9033lPk1tiIYYiOdBex+tUkBlPBhgngpbnDMZYL8/CtPO5izyUBRULFqUAZqKgLWl/Yr
    eL9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795580898;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=dKY3aMlMyjK1lC+5eKZ7v8mVUXG2wOl+AF1hgE7RVI8=;
    b=DESbxEjCy4AQo8UmmOagsAhlaogxR9TNTVKi61m2x8bZ9vWhYJm+kcj5ai7ukGIFUg
    OkLidtN/K/E5fR5MrvCA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIC+l7Brg"
Received: from [192.168.178.48]
    by smtp.strato.de (RZmta 55.6.3 DYNA|AUTH)
    with ESMTPSA id e825d92AP4SGdX2
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 25 Nov 2026 05:28:16 +0100 (CET)
Message-ID: <c7636032-b541-4ae9-b3b6-e3bf6fcec143@xenosoft.de>
Date: Wed, 25 Nov 2026 05:28:16 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
References: <c485c31c-1330-4be2-bb95-447cefa82c1e@linux.ibm.com>
 <4FED0F6E-890F-4482-99F3-39D7520C48FE@xenosoft.de>
 <00f8e9aa-c3ec-1911-d81f-291d3c6ae8f0@xenosoft.de>
 <fb22e9be-3d8d-4849-b191-d004f9b6c457@linux.ibm.com>
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <fb22e9be-3d8d-4849-b191-d004f9b6c457@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06 November 2026 at 07:09 am, Shrikanth Hegde wrote:
> Hi Christian.
>
> On 11/6/26 10:37 AM, Christian Zigotzky wrote:
>> Hi all,
>>
>> Ever since we enabled PREEMPT on our Nemo boards [1], we have been 
>> experiencing occasional problems with the kernel stack.
>>
>> Kernel panic - not syncing: stack-protector: Kernel stack is 
>> corrupted in: srcu_gp_start_if_needed+0x534/0x538
>> Rebooting in 180 seconds..
>>
>
> We had one known issue which michal had brought up.
> Do you have tracing enabled or running a bpf/bcc program?
>
> This is the fix already in upstream. Do you have this patch?
> https://lore.kernel.org/all/20260921072151.35531-1-sshegde@linux.ibm.com/#t 
>
>
>> We are using the following patches: [2] [3]
>>
>> We have disabled PREEMPT with a patch [4] again, and since then our 
>> Nemo boards have been running perfectly once more.
>>
>> As the problem with the kernel stack only occurs sporadically, 
>> bisection is impossible.
>>
>> I hope you can fix the kernel stack issue.
>>
>> Thanks,
>> Christian
>>
>> [1] https://en.wikipedia.org/wiki/AmigaOne_X1000
>>
>> [2] 
>> https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/patches/X1000/preempt_v1.patch
>>
>> [3] 
>> https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/patches/X1000/kvm_powerpc.patch
>>
>> [4] 
>> https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/patches/X1000/Kconfig.preempt.patch
>>
>> [5] Kernel config: 
>> https://raw.githubusercontent.com/chzigotzky/kernels/31c064092e3aab0875c47d44838443c9515b2970/configs/x1000_defconfig
>>
Hi,

We still have stack issues if we using preempt kernels. The patch above 
doesn't solve this issue. I created a patch for disabling preempt for 
Nemo boards.

diff -rupN a/arch/powerpc/platforms/pasemi/Kconfig 
b/arch/powerpc/platforms/pasemi/Kconfig
--- a/arch/powerpc/platforms/pasemi/Kconfig    2026-11-22 
23:57:40.000000000 +0100
+++ b/arch/powerpc/platforms/pasemi/Kconfig    2026-11-24 
13:17:52.878712432 +0100
@@ -19,6 +19,7 @@ config PPC_PASEMI_NEMO
      bool "Nemo motherboard Support"
      depends on PPC_PASEMI
      select PPC_I8259
+    select ARCH_NO_PREEMPT
      help
        This option enables support for the 'Nemo' motherboard
        used in A-Eons's Amigaone X1000. This consists of some

---

It is very difficult to figure out what the issue is because it occurs 
sporadically.

Cheers,
Christian
