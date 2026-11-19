Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099514;
	b=fSzTUhdZax1UR1JePU5iqDYXNRm/bypYYHRAkMfE1CqaZPSqMsf9OyIaBRCDBVGvuL9R
	 pbnSCEnh9deVTyfe3JQKlK4EApwTsLyCqi2q8KEFjBWAn3crFEeGsS61I6TXQS8/2xftL
	 KcbkjS98+rhGnJErFvCXWWZbjm+AUFep2aPAgcwtdpQQGtW5YunvBrobADjSRWxda4JU2
	 nAQ/0boZ/zVccV1LLddr+UV93bLt9TY3AcBVhASPtVgvVPGtAIGYgNCh4oHa5rMfhA4Oa
	 UhXLCyJK5J0O2kpEp+dvWIwcOBx01HBrBI8njMr+gCY7OI1JxrjOK+1SVDTdEXAnUSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099514;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Info-Out:X-JNJ;
	bh=yWpn6wUZyW7eL1ZazwGxkqW9lqhzJ/qHY9x9pIW3Z/I=;
	b=2ukuBJNVqS8P65DYbevTbadjHCxGxS1jYvn4tTjAYKxw/DvzPtiPq7gl/4Hxqnexmgx1
	 s19EaRCtAaNR0dTmLde2QfoY3frQW8nBs+6KCkpxkahOKzLhYn++jN8dqHpS4ZicBiOt4
	 i7EjgD54Hnzi0R1UOCaIM6spAZOb0xt0BV9R5Xp/JJKoTadl17OK34XdVR/EgASX1ZQ9I
	 0NI6dkA+zQ10z5lgjEaNYHRBjpXMtjlaDZWxenlAK7WUtUUOpwEJaIcjn21v/InYOxcCW
	 ElTX8aVOZmH56XxTNhteJP0XDFAYL3IUxF+Jcp9KaKqbpkIwLEB2f7CNo4snkbaxtsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=P8OmoFWV;
	arc=none smtp.remote-ip=57.103.79.31
Received: from outbound.st.icloud.com (st-2005g-snip4-8.eps.apple.com [57.103.79.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3730606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3730606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=P8OmoFWV
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-1 (Postfix) with ESMTPS id D812D18001F9;
	Thu, 19 Nov 2026 14:45:11 +0000 (UTC)
X-ICL-RepId: 01a1f444-cc2c-74b9-92f0-ae69aa4ffd18
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1795099512; x=1826635512; bh=yWpn6wUZyW7eL1ZazwGxkqW9lqhzJ/qHY9x9pIW3Z/I=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=P8OmoFWVffAnoYeLG3U+t62HR8+8KcQHTDnLTawn+6NVueiPfAik9we/Jm8fqOV6piy8UHV6SO+KkTWnHss/hw/jSjnXyB9S5AsXLl1YVYAeqedwyTtsO7gxtnBB2vhJkXFtaPzF1xndrSAO/SJ2dEM/iAjkFd/9rMBO7U2PzuCRAHpvK0hm2w7zW2Th21ofbMIjpu0xp+GcJATQFB85JRTDZUgCndXiuVfYwqv6Ib+3tKWhfRPRvHCM924sapk0FMD2WPPctU7a+GAqaQjPptz0rMNnjai4Dokop8Nl/5Wi+DBfIOw4f+kEPK2TXco4sdK7XDWLqMa3JX+3fSYryg==
mail-alias-created-date: 1440949576000
Received: from localhost.localdomain (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-1 (Postfix) with ESMTPSA id 14F341800320;
	Thu, 19 Nov 2026 14:45:09 +0000 (UTC)
From: Aleksei Riapolov <tsbol@icloud.com>
To: mcanal@igalia.com,
	mwen@igalia.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/v3d: Fix double free of the sg_table when a PRIME import fails
Date: Thu, 19 Nov 2026 18:45:06 +0400
Message-ID: <20261119144506.44824-1-tsbol@icloud.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <99676bca-eba1-46e8-a23a-923bffdc574e@igalia.com>
References: <20261114164451.9222-1-tsbol@icloud.com> <99676bca-eba1-46e8-a23a-923bffdc574e@igalia.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1OCBTYWx0ZWRfXwoM+A93uzlif
 +F9+/0DUBSTk11Qsv+Ek2qAqj8l0dhIkD1K4KIDyfvmnEsWBtEpYJ/Z/ojbkMY0bszCersfH+kB
 d4I55rFoL08RlPC1n58hIH6hX8EO3VEgZKeKRQ5AtruE/KnLbi0bU5t2mGQsoBQ5/7e2Ps0m46u
 lutyM3+5qUq6tQpxZa4pUM7LFw9DDBmTsokgPRaWw2WN0M8a4KLQW/RhTM55bU2NBKNUfzgiTuS
 1VoWHTA6E9lz2snRG2MILhngJe2wguOhWVClmylYIKJ/++Y0wNcfEn5HscsG9Kum0ZY450FoXIU
 7p+ph0wEAeB1G5iwRj3ZDzZQJCv/S8kXsuEs6cEDHZ4pTU9fA/zx14whZZ5zVM=
X-Proofpoint-ORIG-GUID: 9c9njj2Cs0jDUa8Y_68rF8rbGjBVU_yi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1OCBTYWx0ZWRfX2RuqQ02g+Whl
 GDgsthDIeIRL+opQp58KJi+W8UuakunCRNfer+M++QeJliaZmUfgTSe6BOBrP1JZJ0nUebhVE16
 tJcgaXDpa4u5OgJrVwl6VEhBuUEf9c0=
X-Proofpoint-GUID: 9c9njj2Cs0jDUa8Y_68rF8rbGjBVU_yi
X-Authority-Info-Out: v=2.4 cv=UYPE26SN c=1 sm=1 tr=0 ts=6aff0b78
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=x7bEGLp0ZPQA:10 a=RjkQatE54OUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=c8vfPlyRl1mTKFn8zNL0:22 a=1eZBntpQQtp-Twv6SD3W:22 a=VwQbUJbxAAAA:8
 a=v3ZZPjhaAAAA:8 a=PV70Iax4a8Ibjzu37M8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAAB3XJj+RJgUnNZ4zdE3znH65ECpB9r2fIK6v3FH59//VZqS0G0pV8BPdilC1vR6E
 iciV/VO5maEF6LbAIjhjAKdsbgAlaW+nIu3/CM09+644pwFm6JDMtp8mrDIFNY25MW1aNO
 fyL4yzRguOzgiOVrggmfMmEySc6hpfBIdayU8ssWhmrjGbLtUjSoGf8RWafATEO0VhLfsF
 BWiZ0Zvx4N8YFpwjbhcF3ygmfGzH4LTGXbj4J7PdNcmF2ORkIR5Koq2AXssEokWzwJLD1Q
 ROl9QXs6PNiYhihqpfTrMjALz2essAsD9R9HHDKG3TuF8bwjgzIouvqTK9c7Fgn75/s1PQ
 BiV34SW3JmTOFcEhoLlG3HHAhLi3XkXJ/R0eYPRbAqVzxTaXNqBF9jmYoGZWKa5rtdOxJh
 RCJfJpTdnzCH4tjtGW6UV6tQ01rXkGGJ2jSJ/G0qQkcDakKOeEdCqFixO9K0jRgIHEDu7k
 uaey9Hnl4Epi6W/lsZzCbMDaV9DFFMrPnrIFPlqDemp7rQAij+bwXmCaVjdzXTNAvr9Gs2
 7eyFO/yReiHMkeEOVn6rofQj0vyd6NVjTRju/gqe070OwSWqJ8T+z4ovtyRhpPLnutHRL6
 Vg2+Ful4fdMR+hrDI70RaRXTMAcBLUGTXJ2vfmCLHaq7TmAVBfcpD1Ne10BbkNFxaKh4qh
 CLM4s62YIaQBK6rpEPjmX1dQdZgoLjjlviDoSoAyGpNnUNdik0yJNyk3WS/W4Zyb31vCBW
 lm6zWyTbt6ek7F0v9sSwoZQdJ6yr2yLVzaXJzm6IdDuKy7SzEBmCJ8y6hiq3dDi+1mAPlr
 RiPdcrfRkJqSxJOC6nMXkYr+N9FbIVpR3uL+bgkCFZdb/B4HTkNVPbHwS86y+pm9a2vOqY
 Gq+RMFKQhCkk1y5JOy4LXjSA/SWJKCDfZj8g/vL4+VeKc1X8BIyz6X8M49hm2sFaUf0F4p
 RFOZEHjbpSCO6yu25wlr7/Jq0kxS579XwvLyGjnTCF7em8mTufaMJG7EjCRtgEybDctoUO
 J0Iv7bV3vtolP36G9JrNyXGBEm3wclWeoK1B2muHE7rodh0nypdA8mZ8cAlt08DhxEq+nX
 yagART/97mOosFMNyvDuxW2IEEE3DqMDlC1/y55r9N7eYRN8u5oN1KfC279zIqhnsSF+H4
 oOqTvqCygXSPSwHB0Yi79pU1KlTdLhNHLWHT1ThuwgxudcC0NvTI9Ijx+jfCefCB8Ft0iI
 XDVlkv9Hng==

Hi Maíra,

On 18/11/26 09:54, Maíra Canal wrote:
> The issue you reported is real and makes sense, but your fix only treats
> the symptom, not the problem.
>
> V3D allocates the GPU address inside the gem_prime_import_sg_table()
> callback, before the core marks the object as imported. No teardown
> would be correct at that point.

Thanks for the review. v2 moves the allocation out of the callback:

  https://lore.kernel.org/all/20261119144339.43896-1-tsbol@icloud.com/

> I'd rather move the allocation after the import completes. Implement
> .gem_prime_import as a wrapper around drm_gem_prime_import() and call
> v3d_bo_create_finish() once it returns. At that point import_attach is
> set, so drm_gem_object_put() takes the regular import teardown path,
> which unmaps the sg_table once and detaches.

v2 follows this and differs from it in two places.

1. Same-device imports

For a dma-buf that this device exported, drm_gem_prime_import() returns
the BO it was exported from, with one more reference. That BO already
has its node in v3d->mm, so the wrapper returns it without calling
v3d_bo_create_finish() again. A compositor importing its clients'
buffers takes this path: in a glmark2-es2-wayland run under labwc all
5 calls of the wrapper were same-device imports.

2. drm_gem_shmem_free() on failure, not drm_gem_object_put()

drm_gem_object_put() ends in v3d_free_object(), which expects a BO that
v3d_bo_create_finish() completed. When the node was never inserted,
node.start is 0, so v3d_mmu_remove_ptes() would clear the page table
entries from page 0 up to the size of the BO, and those can belong to
other BOs. bo_stats would be decremented without having been
incremented, and drm_mm_remove_node() would run on a node that is not
allocated. With drm_gem_object_put() in the wrapper, the failing import
oopses on the same board:

  Unable to handle kernel NULL pointer dereference at virtual address 00000000000000c8
  pc : drm_mm_remove_node+0x34/0x388
  lr : v3d_free_object+0x88/0xc0 [v3d]
  Call trace:
   drm_mm_remove_node+0x34/0x388 (P)
   v3d_free_object+0x88/0xc0 [v3d]
   drm_gem_object_free+0x24/0x40
   v3d_prime_import+0xc8/0xe0 [v3d]
   drm_gem_prime_fd_to_handle+0xd4/0x280

and bo_stats then counts 14 BOs while 15 are alive. The cleared page
table entries I did not observe: no other BO was alive in that test.

So the wrapper frees the object the way v3d_bo_create() does when
v3d_bo_create_finish() fails. With import_attach set,
drm_gem_shmem_free() goes through drm_prime_gem_destroy(): the sg_table
is unmapped once, the attachment is detached and the reference on the
dma-buf is dropped.

Would you rather have drm_gem_object_put() there, with v3d_free_object()
checking drm_mm_node_allocated()?

One side effect of moving the allocation: v3d_bo_create_finish() now
runs after obj->resv has been pointed at the reservation object of the
dma-buf, so drm_gem_shmem_get_pages_sgt() takes that lock instead of
the private lock of a new object. It is taken interruptibly, so an
import can return -EINTR if a signal arrives while it waits. libdrm's
drmPrimeFDToHandle() retries on EINTR.

Tested on a Raspberry Pi 5, v7.4-rc2 with slub_debug=FZPU:

- the import that exhausts the V3D address space returns -ENOSPC in
  three consecutive fills, on two boots;
- after 50 such failures /sys/kernel/debug/dma_buf/bufinfo lists no
  dma-buf (15 udmabufs attached to v3d while the test holds them);
- a v3d BO re-imported through a second file is the same BO at the same
  offset over 1000 iterations, and bo_stats returns to its starting
  value;
- a vc4 dumb buffer imported into v3d can be mapped, written, read back
  and closed;
- under labwc, glmark2-es2-wayland runs, and mpv playing 4K HEVC from
  the hardware decoder (--vo=gpu and --vo=dmabuf-wayland, --hwdec=drm)
  imports the decoder's dma-heap buffers into v3d about 2500 times;
  none of them is left attached afterwards. The median time of an
  import and the number of dropped frames are the same as with the
  unpatched module, with and without slub_debug.

The kernel log stays clean in all of them. Not tested on other V3D
generations.

Best regards,
Aleksei
