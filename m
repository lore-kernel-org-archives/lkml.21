Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795721337;
	b=qVExAqJWrz7NZGcSsSoWKrovcI2hOpwHmVNMzhKrH1VACI0q4aa/0kFe/K0eE1OhJxh2
	 ZFmIY0fnXfr520yZAMOvDSpxNQFaqUMISfb3+nG6bVdre8znqDxSIo9T61U23SDA5TJnn
	 AJWjsCw+1tDxbSWUsCqLmWM3yDUmD2SAuG8jirsoyIAq2a+H5S0AzonNXUzsHqk8NQFg8
	 vEejbahZXD0I4JrIHWD9krl0+j1A2D6r7bpIfkAv3vNupKeo1Wj45Xf297fjHJM1FYQGW
	 Js+PZfDmN041yKjlUCxfX2Lt6BvrHbxFeZ8q8t9qdJwHyAQh9Wc4T2boCW8YDZIsl2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=+1OO5VSwMOiGthJOHBqMFhGuA/eldCyJEeYuUmEhDMg=;
	b=H56gkatIE+JERQRJohXXMtE6izOy4y9w8AlwJQ2SRTvhnh33dJ3zRvKgdI92ptE3fBX8
	 wMhHbmnSzMupfCK18BwgEXIyxSPFgIOfKJazacB4Jx7nYZWJIcaIFNR2b3oJJALrDEp5C
	 MoQaHWbFLOX0njKeUeu63q8wcvrNG0T4wmOLROhTTrXTFvy349B9s75pEPuPPz150drsX
	 zmZhv3hFsaZLdp4GvnO/+c2O3uftl5qh92AM5qGfgfxclP0Wtp2+L7i2rLS9Gb9zMk+5i
	 UA+TiY1toHJUyW62odYk9wQkf6UrQRp5GcFTCxjq5MSotNDbwv5LmgG8a3ehKRLBH6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Vz2/XDi/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2840B606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2840B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vz2/XDi/
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15ea896ddc8so12075584c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:28:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795721336; cv=none;
        d=google.com; s=arc-20260327;
        b=b/NjO0o+9xbMKhOBbZg1RhsF81XzE03ypFWQCE6cusI8yvfGLEOd70EFqO7MZqrjWC
         NRao23ny6sW3SFnrX5QhmJpcDGd1ctQBY+IBKNYmlYxafnO5iSPCFexqa240SmDIe9FO
         Aql+h3vbvYRavqS0kCNXKbBAeriBXeS7q++B4i60rfD5Z+wRb11oeHKDc/vFw5o99d3o
         n+vHExiH3x/rM/NHcpwN/bSyOQYqzewd/gW+X2/zliztTCbNA2+qYeFhSmM7eEUe3WP8
         3E6tuWLX7UGJOiibzA/jA3/wvNcI9N/Tcm8Z+0+2CUqLNPVPAkQGV5IuJWkJ8BrJtqHF
         eHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+1OO5VSwMOiGthJOHBqMFhGuA/eldCyJEeYuUmEhDMg=;
        fh=uYP7SSdmN1H7JZXWPi8o3qy2IN0JpM/PWIx4xucVi+k=;
        b=pA0DRly5SH2CkaAsPdgz6EmlpCEdWGf/Iwz2tbvlcrE0xy2clJfQBt4Xvpdzus9T19
         AWG7Kz/Ydgrt8zjYRafELU/debin7CqIEBcSi3JLIR9N9kNYy8P2pCY1cMvefWfDb0EB
         pFPzVyTV49KoqHOAYcTzqWJ4B0Ze29OXfqihcdPCKHw8aS3AM3pnNu5DNA/yhXQ4yKnS
         fi+beVtKB1rjPDBdnJBmNRkQjiI4QdCqFcQltAesEB51rzfmwdaUVbOSwGt++A9zwngK
         2qG8Wmx98unZ8XJ9x37jWiFX1WvagcnZNtywss2X3tqfWtcf7tGACD7QmkQ4ETMWVZWE
         2amg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721336; x=1796326136; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1OO5VSwMOiGthJOHBqMFhGuA/eldCyJEeYuUmEhDMg=;
        b=Vz2/XDi/rAwSXbmwXdvx6PK/sobOHzsSUDqC1UnAvB+MwhlAhTpJ3y3kzqhUUKBds4
         Hplltcof4ucm1kfi30MEepkKWQ3ASAkIvwaMpC59AjiXGEO6EKfBqDwj2FAheInAcfgl
         tntXWDN7ovLFas9s1EujY4wkTUNuNp8FfSC1N08PsEqBY3bQ0+zpbbB0gQhgSeLsxIQl
         31Mi6eCXQlwK4RFJhlXK4IvrPhzt9j9eOBhTPBrqg7dmnhWwLafuFiv8ufXDcDttTut5
         mhEk1bO/FFfJZYBvkfmYJzj/BUwTPp5jgbylA1zVwt4Bx6XjrLVAeGuSnLAN+C8Yzkga
         ma0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721336; x=1796326136;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+1OO5VSwMOiGthJOHBqMFhGuA/eldCyJEeYuUmEhDMg=;
        b=R6AfleqtK/O1hTheb4GOCLVFt10bRdQ+bk8Yt0cv6tDH/BvYPQciwkBN6mYoblUrpK
         AY0Bp3D3IzMhLMyTDbeU3rslTY3ZnKdUzq7I2TPndMf93elu+51j4P6mmZpevcR1NJgu
         n6o1JYmB1SNCyfraAuEMaAAXRyDEncAV7OfQPdLXbNQh3yqu0M4KEhg4WeZ81NPTAQNg
         +OtVG2SABMD7s8VVWxhvjpVowvYf4usCaTjcmb7blRzaBsADRoSWy+j+KOIx0ou/ImEV
         RDwTzjtrYIjFQ33Y60gw9nWCRAME4Kp6XyKvjfF2GGmKBywhm64jT2St1Gh9eoKyjlUl
         34Sw==
X-Forwarded-Encrypted: i=1; AL+hErGWchISOLkKizNk6Sc3D+y2YZOYYhFfkZryZQ95zqhlWsUQdDvSZEwTpxDfPwePjPlT7QEdG4Zpy1Uy1xc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7szFzzuyCLSC27478eBYEVKel1CTVk0ZiKX1qMKaQE7phOzPp
	rzUp2hGvLWZtfaUql0pRRDbzG7sWZ2En7a09pZwXhbU1Lp6FeAxceMytkC8ov6kGBzomK+dLR8x
	kNCkFSP0FpejEVJHBfXhD9/xbQhYywfG7XKqiWnc=
X-Gm-Gg: AZFdTZeEmk7XZqN1f0pQnKOD+QMWh7EfzRYh0wl4INPMj9OAC0t+CHQs7gfxEB/toXY
	zsahEIwggNoI4b6AfSgJOgu4CnoqRxLhx5BZIJDil5jS+OUgDdKmC1o+cwwKtbG1Ay+rdOViZeo
	vux9b53doDmjk8XP2c40QLnEunhbSYTOMyV8t5XP+OwD0lwufeAorbBnAVtZL5kThGJDjy1dBBJ
	TNLsYWBxtddxayh6vR8yIFbJu+jvwC0jGrRpcyWxIgU4KpW9sNe25bW24zc+UJgrhE5Eyuxn0Aa
	Q3iO3TsNqkcgQm97hddizD3bSFSIKJnPAynWrQGTmiAnBinfByaZ8sy9HTi+eHa0BVNTYJ1YC9a
	CsUp4m8EwLvBGkYtouQKmGgMCDjPrPCU/wPvMR1jupHzpujInd1LI+bw4mj7/CmHVMGo0pnDZwc
	UcPxIQmN7aB9iSgQ==
X-Received: by 2002:a05:701a:815a:20b0:137:5b9d:cf87 with SMTP id
 a92af1059eb24-1b556695bf9mr20287971c88.0.1795721336067; Thu, 26 Nov 2026
 11:28:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>
Date: Thu, 26 Nov 2026 14:28:44 -0500
X-Gm-Features: Aa3M54qm7DAGowzI8vRO80FKAUnQvis1dj1NJQYc-pQZkjBP1gRBOUqgAmcVlQo
Message-ID: <CADy1qsYumu=QY34qDxL2dPjQc4teadMaMgFS4rR2iAr3rMiqag@mail.gmail.com>
Subject: [PATCH] PCI: dwc: Skip the empty CFG1 window for a two-bus ECAM range
To: mani@kernel.org, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, bhelgaas@google.com, robh@kernel.org
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000005a990f066132f4b9"

--0000000000005a990f066132f4b9
Content-Type: text/plain; charset="UTF-8"

Hi,

The patch is attached as a file rather than inline, because my mail
client cannot send it inline without wrapping lines and converting
tabs. Apologies for that. The commit message is repeated below for
review.

With the iATU-based ECAM mechanism and a host bus resource of [bus
00-01] (bus-range = <0 1> in a device tree),
dw_pcie_config_ecam_iatu() programs the CFG0 window for bus 1 and then
requests a CFG1 window of zero bytes:

  atu.size = (SZ_1M * bus_range_max) - SZ_2M;

dw_pcie_prog_outbound_atu() rejects a zero-size window with -EINVAL,
the error propagates through dw_pcie_host_init() and the host bridge
is never registered.

resource_size() counts both ends of the range, so [bus 00-01] holds
two buses. Bus 0 uses the DBI registers and bus 1 uses the CFG0
window. A CFG1 window is needed only from bus 2 on, that is for three
buses or more. The early return tests "bus_range_max < 2", which lets
the two-bus case through. The patch returns early for two buses as
well.

Tested by replaying dw_pcie_config_ecam_iatu() and
dw_pcie_prog_outbound_atu() in user space against memory-backed
registers, for every bus count from 2 to 256 at two ECAM bases.
Without the change the two-bus case fails with -EINVAL; with it all
510 cases pass and the CFG1 window for three or more buses is
unchanged. Not tested on hardware with a two-bus range. The patch also
builds cleanly on a 7.3.6 tree with W=1.

The code was introduced by f6fd357f7afb ("PCI: dwc: Prepare the driver
for enabling ECAM mechanism using iATU 'CFG Shift Feature'") and is
unchanged in v7.4-rc4.

Thanks,
Felipe

--0000000000005a990f066132f4b9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-PCI-dwc-Skip-the-empty-CFG1-window-for-a-two-bus-ECA.patch"
Content-Disposition: attachment; 
	filename="0001-PCI-dwc-Skip-the-empty-CFG1-window-for-a-two-bus-ECA.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mwxy2h8q0>
X-Attachment-Id: f_mwxy2h8q0

RnJvbSAzOTk4YmI2YzZmOTY1Y2NjOWI1ZWFkNGZkN2MyZTc4NjJmYTUxM2Q1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGZWxpcGUgSW5mYW50ZSBkZSBDYXN0cm8gPGZlbGlwZS5pbmZh
bnRlLmRlLmNhc3Ryb0BnbWFpbC5jb20+CkRhdGU6IFRodSwgMjYgTm92IDIwMjYgMTM6NTQ6MDEg
LTA1MDAKU3ViamVjdDogW1BBVENIXSBQQ0k6IGR3YzogU2tpcCB0aGUgZW1wdHkgQ0ZHMSB3aW5k
b3cgZm9yIGEgdHdvLWJ1cyBFQ0FNIHJhbmdlCgpXaXRoIHRoZSBpQVRVLWJhc2VkIEVDQU0gbWVj
aGFuaXNtIGFuZCBhIGhvc3QgYnVzIHJlc291cmNlIG9mIFtidXMgMDAtMDFdCihidXMtcmFuZ2Ug
PSA8MCAxPiBpbiBhIGRldmljZSB0cmVlKSwgZHdfcGNpZV9jb25maWdfZWNhbV9pYXR1KCkgcHJv
Z3JhbXMKdGhlIENGRzAgd2luZG93IGZvciBidXMgMSBhbmQgdGhlbiByZXF1ZXN0cyBhIENGRzEg
d2luZG93IG9mIHplcm8gYnl0ZXM6CgogIGF0dS5zaXplID0gKFNaXzFNICogYnVzX3JhbmdlX21h
eCkgLSBTWl8yTTsKCmR3X3BjaWVfcHJvZ19vdXRib3VuZF9hdHUoKSByZWplY3RzIGEgemVyby1z
aXplIHdpbmRvdyB3aXRoIC1FSU5WQUwsIHRoZQplcnJvciBwcm9wYWdhdGVzIHRocm91Z2ggZHdf
cGNpZV9ob3N0X2luaXQoKSBhbmQgdGhlIGhvc3QgYnJpZGdlIGlzIG5ldmVyCnJlZ2lzdGVyZWQu
CgpyZXNvdXJjZV9zaXplKCkgY291bnRzIGJvdGggZW5kcyBvZiB0aGUgcmFuZ2UsIHNvIFtidXMg
MDAtMDFdIGhvbGRzIHR3bwpidXNlcy4gQnVzIDAgdXNlcyB0aGUgREJJIHJlZ2lzdGVycyBhbmQg
YnVzIDEgdXNlcyB0aGUgQ0ZHMCB3aW5kb3cuIEEKQ0ZHMSB3aW5kb3cgaXMgbmVlZGVkIG9ubHkg
ZnJvbSBidXMgMiBvbiwgdGhhdCBpcyBmb3IgdGhyZWUgYnVzZXMgb3IKbW9yZS4gVGhlIGVhcmx5
IHJldHVybiB0ZXN0cyAiYnVzX3JhbmdlX21heCA8IDIiLCB3aGljaCBsZXRzIHRoZSB0d28tYnVz
CmNhc2UgdGhyb3VnaC4KClJldHVybiBlYXJseSBmb3IgdHdvIGJ1c2VzIGFzIHdlbGwuCgpUZXN0
ZWQgYnkgcmVwbGF5aW5nIGR3X3BjaWVfY29uZmlnX2VjYW1faWF0dSgpIGFuZApkd19wY2llX3By
b2dfb3V0Ym91bmRfYXR1KCkgaW4gdXNlciBzcGFjZSBhZ2FpbnN0IG1lbW9yeS1iYWNrZWQKcmVn
aXN0ZXJzLCBmb3IgZXZlcnkgYnVzIGNvdW50IGZyb20gMiB0byAyNTYgYXQgdHdvIEVDQU0gYmFz
ZXMuIFdpdGhvdXQKdGhlIGNoYW5nZSB0aGUgdHdvLWJ1cyBjYXNlIGZhaWxzIHdpdGggLUVJTlZB
TDsgd2l0aCBpdCBhbGwgNTEwIGNhc2VzCnBhc3MgYW5kIHRoZSBDRkcxIHdpbmRvdyBmb3IgdGhy
ZWUgb3IgbW9yZSBidXNlcyBpcyB1bmNoYW5nZWQuIE5vdAp0ZXN0ZWQgb24gaGFyZHdhcmUgd2l0
aCBhIHR3by1idXMgcmFuZ2UuCgpGaXhlczogZjZmZDM1N2Y3YWZiICgiUENJOiBkd2M6IFByZXBh
cmUgdGhlIGRyaXZlciBmb3IgZW5hYmxpbmcgRUNBTSBtZWNoYW5pc20gdXNpbmcgaUFUVSAnQ0ZH
IFNoaWZ0IEZlYXR1cmUnIikKQXNzaXN0ZWQtYnk6IE9wZW5BSSBDb2RleApBc3Npc3RlZC1ieTog
Q2xhdWRlIEZhYmxlIDUuMgpTaWduZWQtb2ZmLWJ5OiBGZWxpcGUgSW5mYW50ZSBkZSBDYXN0cm8g
PGZlbGlwZS5pbmZhbnRlLmRlLmNhc3Ryb0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWhvc3QuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1ob3N0LmMgYi9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUtaG9zdC5jCmluZGV4IGJiYjAyNDUuLjBhYjgwNzQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1o
b3N0LmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWhv
c3QuYwpAQCAtNDQ3LDcgKzQ0Nyw3IEBAIHN0YXRpYyBpbnQgZHdfcGNpZV9jb25maWdfZWNhbV9p
YXR1KHN0cnVjdCBkd19wY2llX3JwICpwcCkKIAogCWJ1c19yYW5nZV9tYXggPSByZXNvdXJjZV9z
aXplKGJ1cy0+cmVzKTsKIAotCWlmIChidXNfcmFuZ2VfbWF4IDwgMikKKwlpZiAoYnVzX3Jhbmdl
X21heCA8PSAyKQogCQlyZXR1cm4gMDsKIAogCS8qIENvbmZpZ3VyZSByZW1haW5pbmcgYnVzZXMg
aW4gdHlwZSAxIGlBVFUgY29uZmlndXJhdGlvbiAqLwotLSAKMi41Ni4xCgo=
--0000000000005a990f066132f4b9--
