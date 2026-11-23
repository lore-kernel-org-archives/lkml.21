Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401355;
	b=TFWhxMr6j4tL/Ett8CZqRxWTJ9KOK4xXbIERR6gU8i6Jn2+piAE1U69CE9T4Ppesgc4L
	 j8mCt6VuQh9tsz5B5yifDsaTHQgG3sgxBhfWJJko9tqItYW97bF8ozzZwp5FeU2eD/sAq
	 Gui9S4fVvOID3V0k7uFAsZmzNsuHSYYnKj5eQ6xiCKky8q4X8fq77R7awLzSbctCLrTc1
	 RNhVY/KJSzNJDAv+6WY1kodu3qJ453wIGjxq+gOrEtUMQKDHm+BIM2YjVaOzHL0FpXahA
	 kGqmv45D3Z8kI4WPtbHVqLpYmvBYiMGo7vsObhUsCV1aJdDzknVudhTUIwSKLOOUcbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zta3sFkY9ZZMc3gNgFpjOMOV1WUQyr5rBabD1DfSZCg=;
	b=NfWBiav1I7Q4DaIFlmECdSjzz+k8pQxDd6mKh3r+2KTQRZih5mMiZE+qaV7OaN36aBAj
	 01HrXtGtrLqOGwWGwESUaGju8EYK2M3TR5r3t+PGnIQWuJ9aP4dq8Pz5XnYfFZkODSuPP
	 YL4+Y8lpKZ2SODOo9uJrf3wDUlHqbjsaVWaboKfrZPV4BW0gPJPaHAVU4ZQwRdTUhGKmW
	 uir92RuBu0pG/osfh4NW0OC8bP/uIw84vUoDWn8Lijlo/cM0LxwxVq+U3+BymG3w1eu/g
	 1zM32KegGH1CPF2PyrYYc4HG2woijRIB1CUvqsfRJVChzPeXVRH7Xok8cUsGoKkfHNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=BJCrS3JH;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE26606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCE26606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=BJCrS3JH
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f046b0adc0so12668515ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795401354; x=1796006154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zta3sFkY9ZZMc3gNgFpjOMOV1WUQyr5rBabD1DfSZCg=;
        b=BJCrS3JHZno1ZOGCIRrsnBlhxJL7LQiQbtgUazIMUf1wxGRUVwTAiN3WZHnkVH0aP4
         4XG4QAc6ow+9yekJ46j9bdcsIEQNsezCcArr+GlIxsfqXKUBjYOpUnKJ0nP+ZnsiP+u3
         8o6Dfh23f+59hbZTTCYiRhQahRZSgboDcy3Aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401354; x=1796006154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zta3sFkY9ZZMc3gNgFpjOMOV1WUQyr5rBabD1DfSZCg=;
        b=JmSgt+hi55Gp2mvO8JuAVEtC0HrDVT+VFMEjPY2afkbAvh39rZsX6bk1iRU5rkN6Ma
         HxGNi+UcmqX78NY8pNGSTjWLlPU0qgGj5XOyKi9xP5swYZUdFJlllW0XAWKahn1p7GuH
         q1LV5/5t1H7p9JJeMw/mHG71v++M/+x/Cdr0uQJfcQLysoP2WweQcUaGfLYM6MpRw4A/
         29EgAvh+fbzPWRGd1B4G7tZjN4SAttgglP6H0ioTfFHicT4sflp9JxHS4JQ/xS6yHpHo
         7g+tsqr/ngM5zdiCCR62eAc9pfB14NxUa4ePgb0YFwVLhsASUMUyCPXZPwDsXl2tUd9b
         bccQ==
X-Forwarded-Encrypted: i=1; AL+hErETNfUT3QOPY/fbQ6DCn8zzHfAY/JVRZx7523zYK/d2oujItxglc9ahax8BVDPrqsR+IjzZk92dsqWtcXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mcxVYglZCuEWnq8p49RaLAMi5bXEXtT0WqkgT1gvyJ7TBiWk9
	N/1ioDfTl2oTP9ttKpPeS3ci2z7dJOi1Wq8QubFi594Q8jVbuvDMGP3YhzFH/hrcLbs=
X-Gm-Gg: AZFdTZcF41+TZDn9WG2z9bU70q0FimfVeri6YRtK4HUM4Ubddxt+O3YOR8hePTfhcGd
	xASNeZYgqJ9EW1M2x9nodnsFABnJxG5aLq5YGy0UdiwZLzCD32FksNTPRQ8EbQjT+Qv0tTMXB5G
	dg+CXbbKAZLZbAiD9xnvJVObO1BUpYEGLyWGyekzfdZ9a20Z8IB+T0A9Qf4L0s3CZPIv0P9tc8D
	RCtrmVl54XB2WVn0uIJh+Htmx1ov4Emf/i3hYK5AslbXf8iUkwCLbTRNrDDJ/z450sFaVy8VtXt
	I2TgZ2J88pwesGKHxSdQ2QolJ4KfuEPDwt0v6DWeXPgEW/tpieizeTC9c8jcmWzrYXuPB+gwKhC
	uvrYOSIo00FlSHo9gNixChsubrEYJBodLKt/WJO9jDIHAON7fY3An/Z41R29x017TwFYs0RiciK
	rGfUUC3ato3pGU1ceMOhkJDjX6dzaVBlXKtDkNBRe0dG65i4hW8Y97Mw8IWC7Knz4MPirsAbDVA
	48xHuQeZnn+jjxHFvU0ygrM4UADySTcCPR3HRmPp6wkFtEgslkqWrp9DSWf5kQU1O0RcC0Z3wVg
	QykaEWFBPMJEqGn6MyGiN5WLakS4z2oXzMyWI8KJARBaeBUVAOl5J/XPo5oAeAEymjyXXd+bf2B
	b/xCeSMyB+VvAMwyaojpsGVSZEQGrVJVYvShz7mPEYH9EHprdgheyOlIgGS5DR/YO
X-Received: by 2002:a17:903:32ce:b0:2ef:ed25:514a with SMTP id d9443c01a7336-2f03f16ac68mr91947455ad.44.1795401354275;
        Sun, 22 Nov 2026 18:35:54 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm43609925ad.59.2026.11.22.18.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:35:53 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [BUG] net/nfc: a 16-bit truncation in nfc_llcp_allocate_snl() overruns the SNL response skb and BUGs the kernel
Date: Mon, 23 Nov 2026 08:05:47 +0530
Message-Id: <20261123023548.3351531-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

nfc_llcp_allocate_snl() accumulates its allocation size in a u16 while the
length it is given is a size_t.  An SNL PDU carrying enough SDREQ TLVs makes
that sum wrap, the response skb is allocated far too small, and
nfc_llcp_send_snl_sdres() then puts the full TLV list into it: skb_put()
trips skb_over_panic() and the kernel BUGs.

Reproduced on net.git main at af6737b90668 ("net: af_key: fix use-after-free
in dump_sp()"), 7.4.0-rc3-01164, with KASAN.  A patch is in the next mail of
this thread.


1. Root cause

net/nfc/llcp_commands.c, nfc_llcp_allocate_snl():

	struct sk_buff *skb;
	struct nfc_dev *dev;
	u16 size = 0;                           <-- u16
	...
	size += LLCP_HEADER_SIZE;
	size += dev->tx_headroom + dev->tx_tailroom + NFC_HEADER_SIZE;
	size += tlv_length;                     <-- tlv_length is a size_t

	skb = alloc_skb(size, GFP_KERNEL);

The caller is net/nfc/llcp_core.c, nfc_llcp_recv_snl(), which walks the TLVs
of a received SNL PDU and builds one SDRES TLV for every SDREQ it finds:

	case LLCP_TLV_SDREQ:
		...
add_snl:
		sdp = nfc_llcp_build_sdres_tlv(tid, sap);
		if (sdp == NULL)
			goto exit;

		sdres_tlvs_len += sdp->tlv_len;
		hlist_add_head(&sdp->node, &llc_sdres_list);

and at the end passes the accumulated length:

	if (!hlist_empty(&llc_sdres_list))
		nfc_llcp_send_snl_sdres(local, &llc_sdres_list, sdres_tlvs_len);

The accounting on this side is exact - every entry added to the list also
adds its length - so the list and sdres_tlvs_len always agree.  What does
not agree is the u16 inside the allocator.

An inbound SDREQ TLV costs three bytes (type, length, tid, with an empty
service name), and the SDRES it produces is four, so sdres_tlvs_len is four
thirds of the PDU's TLV area.  About 48 KiB of SDREQs therefore pushes it
past 65535.  nfc_llcp_send_snl_sdres() then walks the list regardless:

	hlist_for_each_entry_safe(sdp, n, tlv_list, node) {
		skb_put_data(skb, sdp->tlv, sdp->tlv_len);

		hlist_del(&sdp->node);

		nfc_llcp_free_sdp_tlv(sdp);
	}

With 16400 SDREQs the accumulated length is 65600, which truncates to 64,
and the skb that should have held 64 KiB holds none of it.


2. How the PDU gets large enough

The NCI data path reassembles fragments before the LLCP layer sees them
(net/nfc/nci/data.c, nci_add_rx_data_frag()), so the PDU that reaches
nfc_llcp_recv_snl() is not limited to one NCI packet: a sequence of
PBF_CONT fragments accumulates into one skb, and the final fragment
delivers it.  The reproducer uses 64 KiB fragments.

The LLCP MIU negotiated for I-frames does not bound this path; SNL is
handled directly out of the receive skb by nfc_llcp_rx_skb(), and
nfc_llcp_recv_snl() walks whatever linear area that skb has.


3. KASAN reports

net.git main, 7.4.0-rc3-01164-gaf6737b90668, KASAN (full log attached as
kasan-nfc-snl-skb-over-panic-mainline-7.4-rc3.txt):

  skbuff: skb_over_panic: text:ffffffff87e134e6 len:382 put:4
          head:ffff88801d2016c0 data:ffff88801d2016c4 tail:0
  kernel BUG at net/core/skbuff.c:215!
  Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
  Workqueue: events nfc_llcp_rx_work
  RIP: 0010:skb_over_panic+0xcd/0xd0
   skb_put
   skb_put_data
   nfc_llcp_send_snl_sdres
   nfc_llcp_recv_snl
   nfc_llcp_rx_skb
   nfc_llcp_rx_work
   process_scheduled_works

"put:4" is one SDRES TLV; the skb had no tailroom left for it.

The same reproducer on 7.3.1 gives the identical BUG at the line that
skb_over_panic() occupies in that tree (skbuff.c:214,
kasan-nfc-snl-skb-over-panic-7.3.1.txt).


4. Impact

A kernel BUG() in a workqueue context: the machine panics with
panic_on_oops, and otherwise the worker thread is killed with the LLCP
local's locks still held, which wedges the NFC stack.

The overflow itself never writes past the allocation, because skb_put()
checks before copying - this is a denial of service rather than memory
corruption.  It is reachable by whoever can deliver an SNL PDU to an NFC
device: an NFC peer over the air, or a local process that owns an NFC
device able to inject target-mode data.  No capability check stands between
a peer's PDU and this path.


5. Reproducer

nfc_llcp_snl_sdres_overflow.c in this directory (sent off-list on request;
see the note at the end).  It brings up a virtual NCI device, answers the
kernel's bring-up commands, activates target mode, then delivers an SNL PDU
of 16400 SDREQ TLVs across PBF_CONT fragments.  It BUGs the kernel within a
second on both trees.


6. Suggested fix

Hold the size in a size_t, so the value that reaches alloc_skb() is the one
the caller computed:

	-	u16 size = 0;
	+	size_t size = 0;

A request that large can now fail the allocation instead of wrapping, and
both callers of nfc_llcp_allocate_snl() already handle the IS_ERR() return.

The patch follows in this thread.  Checkpatch is clean.


7. What was and was not checked

Checked: the fault reproduces on net.git main under KASAN; the patched
kernel is clean on the same reproducer; ordinary LLCP traffic (SYMM, CONNECT,
I-frames, an SDREQ/SDRES exchange of a few TLVs) still works with the patch
applied; net/nfc/llcp_commands.c and net/nfc/llcp_core.c are byte-identical
between 7.3.1 and af6737b90668, so nothing in between changes this path.

Not checked: real hardware - all of this is on a virtual NCI device under
QEMU.  We have not tried to drive the path from an over-the-air peer.

No Fixes: tag is given: the u16 has been in nfc_llcp_allocate_snl() since
the SNL support was added, and our clone of net.git does not reach that
commit.  Happy to add the exact tag if you would like one.

This was found by AI-driven fuzzing built on top of syzkaller; its analysis
was then checked by hand against the code and every claim above was
reproduced.

Kapil Vaswani
Piyus Kedia
