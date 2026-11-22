Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.118.224.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795326709;
	b=EkgnuHp+mBkzzQxmEi9nfYigPs4ywCQYSIupQin7u3RU9SEP4R73c5DXc3oymRmaeTer
	 M6Ya5wv7IvD/YH2pd3b6KR+v/SilghFrLvTXF7EN/66l2WFnbJEdYg/BRVPH+0d1ITgJy
	 vE1/ZsWrMvRevLzppSDaz5zl2RPY5t3SDe3LuJjaiCdSxCWviDQf5LkbMyqsscRlRjSfD
	 +QnVMc1nr5XmqjqUgPlKq2iyrQtRpofmWH7rzy0Yk+K0dU7PkOKnMEJO8R+MgiOQNByW1
	 8VDVd7ITGTPDvmlPai1l+yjwvlflX9IgJ9LhOX4snoychuBB5Ug8nGcLWYgteOQXvrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795326709;
	h=DMARC-Filter:Received:X-Originating-IP:Date:X-CM-HeaderCharset:From:
	 To:Cc:Subject:X-Priority:X-Mailer:X-CM-CTRLMSGS:
	 Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	 X-Coremail-Locale:X-CM-TRANSID:X-CM-SenderInfo:X-Coremail-Antispam;
	bh=qkLQzAOKh39KdTRpkQJLElksJFCsbYETiz/YkICCEb0=;
	b=wXtBFyUqR1talfBxeG+2jsFUNitP+lLAGNex+EQEW+8FH0Qj5CcgjPOTOt1d5wiP4tE+
	 lW3Ubfj66b8pHvdwQ1ZwVdoUuQhO3xhRy+VPuZFkZuHPSR4mkewlcEkcAzRKQcK/RO9qm
	 D7vURKqBzprvJzavG0mPlPhfEQvP/KAaoX0QKhDUtR2y9T2tq1xHoK7qunbd4BJK/JF+P
	 IkLUQOCYG1/m2IGEJpgE1ZlqLSYNPQAhNeVAsIHqZot/U5DwCm5JitOYarBucrkCn3smA
	 25hz34AbiKElQl4x+7vG+Lgkg4lgJ1+ds7Au/nAIx+JH5GkMUH9Ku/a/sxrf6IfWe2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alu.hit.edu.cn;
	spf=pass smtp.mailfrom=alu.hit.edu.cn;
	arc=none smtp.remote-ip=202.118.224.62
Received: from mail.hit.edu.cn (mail.hit.edu.cn [202.118.224.62])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D25606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D25606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alu.hit.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alu.hit.edu.cn
Received: from 220110626hanxuechao$alu.hit.edu.cn ( [219.223.233.19] ) by
 ajax-webmail-mail-appserver03 (Coremail) ; Sun, 22 Nov 2026 13:51:27 +0800
 (GMT+08:00)
Date: Sun, 22 Nov 2026 13:51:27 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: 220110626hanxuechao@alu.hit.edu.cn
To: linux-rockchip@lists.infradead.org
Cc: "Heiko Stuebner" <heiko@sntech.de>,
	"Liu Changjie" <liucj1228@outlook.com>,
	"Alexey Charkov" <alchark@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC] arm64: dts: rockchip: rk3576-lckfb-tspi-3m: sdmmc0_det_l
 question
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2026.2-cmXT5 build
 20261015(8d7e304b) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-0670b814-d594-4118-92e0-dc1bc2f00e12-hit.edu.cn
X-CM-CTRLMSGS: =?B?4U4dcjiH6nJ5xwDR7hwMki1N8jM=
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <5e6ebf68.3773.1a201cf3894.Coremail.220110626hanxuechao@alu.hit.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:P0WgCgDXlYffggJrW6MxAA--.1562W
X-CM-SenderInfo: yssqiiaqwslx5dq03vpfkd0qhdoxhxllwovvfxof0/1tbiAgQTAGs
	BgIcYVgAFsz
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

SGkgSGVpa28sIExpdSBDaGFuZ2ppZSwKCkkgaGF2ZSBhIHF1ZXN0aW9uIGFib3V0IHRoZSBTRCBj
YXJkIGRldGVjdCBjb25maWd1cmF0aW9uIG9mIHRoZSBMQ0tGQgpUYWlzaGFuIFBpIDNNLgoKVGhl
ICZzZG1tYyBub2RlIHVzZXMgdGhlIGJvYXJkLXNwZWNpZmljIHNkbW1jMF9kZXRfbCBncm91cDoK
CiAgICBzZG1tYyB7CiAgICAgICAgc2RtbWMwX2RldF9sOiBzZG1tYzAtZGV0LWwgewogICAgICAg
ICAgICByb2NrY2hpcCxwaW5zID0gPDAgUktfUEE3IFJLX0ZVTkNfR1BJTyAmcGNmZ19wdWxsX3Vw
PjsKICAgICAgICB9OwogICAgfTsKCndoaWNoIG11eGVzIEdQSU8wX0E3IGFzIGEgR1BJTywgbWF0
Y2hpbmcKCiAgICBjZC1ncGlvcyA9IDwmZ3BpbzAgUktfUEE3IEdQSU9fQUNUSVZFX0xPVz47CgpU
aGUgU29DIGR0c2kgYWxyZWFkeSBwcm92aWRlcyBzZG1tYzBfZGV0IGZvciB0aGUgc2FtZSBwaW4s
IHVzaW5nIHRoZQpTRE1NQzBfREVUbiBmdW5jdGlvbiBpbnN0ZWFkOgoKICAgIHNkbW1jMF9kZXQ6
IHNkbW1jMC1kZXQgewogICAgICAgIHJvY2tjaGlwLHBpbnMgPSA8MCBSS19QQTcgMSAmcGNmZ19w
dWxsX3VwPjsKICAgIH07CgphbmQgb3RoZXIgUkszNTc2IGJvYXJkcyB1c2UgaXQgdG9nZXRoZXIg
d2l0aCBjZC1ncGlvcywgZm9yIGV4YW1wbGUKcmszNTc2LWV2YjEtdjEwLmR0cyBhbmQgcmszNTc2
LWV2YjItdjEwLmR0cy4gQm90aCBncm91cHMgY29uZmlndXJlIHRoZQpzYW1lIHBpbiB3aXRoIHRo
ZSBzYW1lIHB1bGwtdXA7IG9ubHkgdGhlIHBpbiBmdW5jdGlvbiBkaWZmZXJzLgoKSSB0ZXN0ZWQg
dGhlIG5vZGUgYmVsb3cgb24gYSBUYWlzaGFuIFBpIDNNIHdpdGggbWFpbmxpbmUgdjcuNC1yYzIs
CmkuZS4gd2l0aCBzZG1tYzBfZGV0IGluc3RlYWQgb2Ygc2RtbWMwX2RldF9sIGFuZCBjZC1ncGlv
cyB1bmNoYW5nZWQsCmFuZCBjYXJkIGluc2VydGlvbiBhbmQgcmVtb3ZhbCBhcmUgc3RpbGwgZGV0
ZWN0ZWQgY29ycmVjdGx5OgoKICAgICZzZG1tYyB7CiAgICAgICAgYnVzLXdpZHRoID0gPDQ+Owog
ICAgICAgIGNhcC1zZC1oaWdoc3BlZWQ7CiAgICAgICAgY2QtZ3Bpb3MgPSA8JmdwaW8wIFJLX1BB
NyBHUElPX0FDVElWRV9MT1c+OwogICAgICAgIGRpc2FibGUtd3A7CiAgICAgICAgbWF4LWZyZXF1
ZW5jeSA9IDw1MDAwMDAwMD47CiAgICAgICAgbm8tbW1jOwogICAgICAgIG5vLXNkaW87CiAgICAg
ICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKICAgICAgICAvKiBHUElPMF9CNi9TRE1NQzBf
UFdSRU4gaXMgbm90IGNvbm5lY3RlZCBvbiB0aGlzIGJvYXJkLiAqLwogICAgICAgIHBpbmN0cmwt
MCA9IDwmc2RtbWMwX2NsayAmc2RtbWMwX2NtZCAmc2RtbWMwX2RldCAmc2RtbWMwX2J1czQ+Owog
ICAgICAgIHZtbWMtc3VwcGx5ID0gPCZ2Y2NfM3YzX3MwPjsKICAgICAgICB2cW1tYy1zdXBwbHkg
PSA8JnZjY2lvX3NkX3MwPjsKICAgICAgICBzdGF0dXMgPSAib2theSI7CiAgICB9OwoKQ291bGQg
eW91IGV4cGxhaW4gdGhlIHJlYXNvbmluZyBiZWhpbmQgdXNpbmcgc2RtbWMwX2RldF9sIGluc3Rl
YWQgb2YKc2RtbWMwX2RldCBoZXJlPyBDYXJkIGRldGVjdGlvbiBhbHNvIHdvcmtzIHdpdGggc2Rt
bWMwX2RldCBpbiBteQp0ZXN0aW5nLCBzbyBJIHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFuZCB3aGV0
aGVyIHRoZSBib2FyZC1zcGVjaWZpYwpncm91cCBpcyByZXF1aXJlZCBvciBqdXN0IGEgcHJlZmVy
ZW5jZS4KClRoYW5rcywKWHVlY2hhbyBIYW4=
