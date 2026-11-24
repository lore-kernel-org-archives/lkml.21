Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539924;
	b=lowHVrMb+H9W8TKqKA7/dRyON50zQI9rd9m+mEK1et1wCsYH2bYNpcn7CifXY86iWSlj
	 NC4E1LKuv1H+K96SEzwgqxIvF73+YPYynjMOtayV/x0LEW7e5aFTZXYlM9C2khiFyy0nx
	 XH8OQgbdr0WRzpffJoUNYuE2wyoeacQSnQ433QVmLYcR5j0s3+PFjAZiEXUP73ip/2qf1
	 NX/OhTcXoL1Bvg/xC/8r+NWXAAQgFaN3zYTiJItebUbtvP1r0T+z031s9FbyQ6NcCgNm7
	 175/am6VJprr/z/ENg8y+dFgy9/b7UXLat5vjEG6P9B26L7n66NdanDzdD4xV101qqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID;
	bh=ffk4YQzeNnCAs3ZskrsO2BWcOw3Pl3rB7ma4V38WJp0=;
	b=KcD7Znmegr5B6uZlAOCecjBCRz3/lfKJThFMMo0sd4f1fHZ89mNLRef6dAgtHyZ/LI/H
	 RaHADJ3t4kepP/SIwSM8oWm/QJZ8vCGaPXhOvWawlJ5RDS4e9GJNxgiet6YGhMj7YQB7l
	 BuZxklPY8XRzI0y3kx3yULXdN/ObkFYAEbv1SyK1u4FZkAlLa3rdDfjjfhrupeQLOSMrL
	 hqtKHt9T5O+yVP3tT5HURbqjmwN0UR8S417bDnUCyJ6oj+Cfd3eE5TvERJLk2JdRoPGsJ
	 RgO8GFudXA9b13z3/V4Up55LSj53qVYvTohEXOzg1saBDU5QWiqAC1hcrCWFbQon6GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Hrg19vq/";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4DA606A332
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E4DA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hrg19vq/
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso46160725e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539922; x=1796144722; darn=vger.kernel.org;
        h=message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ffk4YQzeNnCAs3ZskrsO2BWcOw3Pl3rB7ma4V38WJp0=;
        b=Hrg19vq/nmpSkshYEQFNnq4MLH9pMGwVNXUeMCELtxzVyGYYj29mgWksjtcFIbDwLs
         AbJr0FbAGIj+OAuwkYGhJtjtlr84P51ClxGM12lnimBaq5nZjaUo6XVrgSqlCu45b6gs
         pn99ahpQAypu7stapx4vvOj5QU4mJAK+RitHmpV9YiPOZa6J0blVCNu62ImeQEjWQpQw
         r36sH8i/APTE1TatM001bN5TFmc2F6mKrGE9qpuEXnBngCCHUflgS8ih70GW9HHwfAPL
         ghi+s2geL8FoIke3QBdPkgdEQpCphhQKV7E7z9Kgsn3s8vc1uUvB1HgMvM/ZudeKtE6f
         SWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539922; x=1796144722;
        h=message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ffk4YQzeNnCAs3ZskrsO2BWcOw3Pl3rB7ma4V38WJp0=;
        b=kn1ftl/JqmerUsfX8pnKgDTl5AZLiRrIo0QbT8jpTFTMBHY0jyxsW+Y2p6CubgOxO4
         0ps8HwgbyNk/SXhlutnqCI/6DWLNKxg54AxI4gfRZGTdGybw5p83rZWRRDS45Qxxu8eD
         Yh6IOM3RjXLH1f+FW1DGjtgvrnwNPoCK1dpWp38aL+SSnQEy4muP/biu/MgyuZcM+CLa
         Ymy5X8yWhs1SNU3f+bQznp9bLwGZ169SnBjVIbrbiVMtdijnXayldTk4QRBbGwpbxBto
         zn7clKOLAaVMkrbI7AX+I+mvhvqwm2XqqETKnDUkdfG4rvlGX6fa0oID1C9YNfl0EPWa
         1T1g==
X-Forwarded-Encrypted: i=1; AL+hErEPGGtUs/lknaZcfiLigfc9AHmenUXqj3QRHzziG7oMNIb/XWBFSAqVxqWE0pyb9D7eILYXmYe+2jbjerE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DDWwy4Hot5wSDHMO6aF6/W6MusdRPjz3flTrhzy13uAgk1t93
	F3LLC80bfIKb7fBbn3TXB2cJ9KB9qH0XXcKcgde94pAM/9v1AwqW45hn
X-Gm-Gg: AZFdTZdQ0iKWlPKApPmpnDzw8593CLTNc8w2ywa8mO+J//IAt9etHYak52imxpgIHTr
	L+7Da0PWd7dbbPs0nd3FvWskbpJJrmFkLKx5HisTEg/WecLkteF2JWKCmPrCHdAU/bsGNbFlfcg
	nxX3j06IQliexONRXlIA8bpGbL68leZVaaffllcE0BGc3SEs/EkHo/4WF3yOwmWleJpFFx6zcOU
	nkBECddxxhkDNFKaHcvYNG3WIfZW2Wj/aSxDEFcDx5FhOmHyAp1J5EwkoHx2LYChxptR7Ji9WbY
	aTDqaY0KR/e2St9aERKkeDrnR8WFn+f1IoIpYsfdC0iDWVNMy/j14p3AqNsCQGAcLn+35YFBBcK
	3pB/fY4Yw7HKSXuiowHPURCI6axh9kuI+Ho/99bHvvkIYXKeAvIm93LvRcZzdhCs5jrALVjhbpB
	v11eoyDvwTGeOviGwzBkRFQgRoUYyAocFacJtumljZ/o6DN5X7xPLCawIp/8PZhvUOT7ucZfeUp
	znq+DZ9ovYlu85j242ZIZfChGblnFc0sC38xNye7n5wg02umy4kv8Bu
X-Received: by 2002:a05:600c:37c9:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4bb888251b4mr276173155e9.32.1795539921735;
        Tue, 24 Nov 2026 09:05:21 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm458176075e9.3.2026.11.24.09.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:05:21 -0800 (PST)
Date: Tue, 24 Nov 2026 09:05:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: vkoul@kernel.org
Cc: srinivas.kandagatla@oss.qualcomm.com, andersson@kernel.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v6] soundwire: qcom: check clk_prepare_enable() return values
Message-ID: <e5fda000d0dc4f168120c8ec91a752d5@gmail.com>

Y2xrX3ByZXBhcmVfZW5hYmxlKCkgY2FuIGZhaWw7IHVuY2hlY2tlZCwgdGhlIGRyaXZlciBwcm9j
ZWVkcyB0bwp0b3VjaCByZWdpc3RlcnMgd2l0aCB0aGUgaW50ZXJmYWNlIGNsb2NrIG9mZiwgd2hp
Y2ggYWJvcnRzIG9uIGFybTY0LgpDaGVjayB0aGUgcmV0dXJuIHZhbHVlIGluIHRoZSBpbnRlcnJ1
cHQgaGFuZGxlciAocmV0dXJuaW5nIElSUV9OT05FLAphcyB0aGUgaW50ZXJydXB0IHN0YXR1cyBp
cyBub3QgcmVhZCBvciBjbGVhcmVkIG9uIHRoYXQgcGF0aCksIGluCnByb2JlLCBhbmQgaW4gdGhl
IHJ1bnRpbWUgcmVzdW1lIHBhdGggKHJldHVybmluZyB0aGUgZXJyb3Igd2l0aG91dAp1bm1hc2tp
bmcgdGhlIGxldmVsLWhpZ2ggd2FrZSBJUlEsIHdoaWNoIHdvdWxkIHN0b3JtIHdoaWxlIHRoZSBz
bGF2ZQprZWVwcyBkcml2aW5nIHRoZSBsaW5lKS4KCkZpeGVzOiAwMmVmYjQ5YWE4MDUgKCJzb3Vu
ZHdpcmU6IHFjb206IGFkZCBzdXBwb3J0IGZvciBTb3VuZFdpcmUgY29udHJvbGxlciIpCkZpeGVz
OiA3NGU3OWRhOWZkNDYgKCJzb3VuZHdpcmU6IHFjb206IGFkZCBydW50aW1lIHBtIHN1cHBvcnQi
KQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVy
IDx5YXNzMjcxMDZAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogU3Jpbml2YXMgS2FuZGFnYXRsYSA8
c3Jpbml2YXMua2FuZGFnYXRsYUBvc3MucXVhbGNvbW0uY29tPgotLS0KUmViYXNlZCBvbiBzb3Vu
ZHdpcmUgZml4ZXMgKHNkdy9maXhlcykgYXMgcmVxdWVzdGVkOyB0aGUgcnVudGltZS1yZXN1bWUg
aHVuawpub3cgc2l0cyBvbiB0b3Agb2YgInNvdW5kd2lyZTogcWNvbTogZGlzYWJsZSB0aGUgaW50
ZXJydXB0IGJlZm9yZSBnYXRpbmcKdGhlIGNsb2NrIi4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgog
ZHJpdmVycy9zb3VuZHdpcmUvcWNvbS5jIHwgMTUgKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3NvdW5kd2lyZS9xY29tLmMgYi9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKaW5kZXggMTQ3
ZTU1YjdhNjAuLmNhMzEyYzE4OTc5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9xY29t
LmMKKysrIGIvZHJpdmVycy9zb3VuZHdpcmUvcWNvbS5jCkBAIC03NzgsNyArNzc4LDkgQEAgc3Rh
dGljIGlycXJldHVybl90IHFjb21fc3dybV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZf
aWQpCiAJdTMyIGk7CiAJaW50IGRldm51bTsKIAlpbnQgcmV0ID0gSVJRX0hBTkRMRUQ7Ci0JY2xr
X3ByZXBhcmVfZW5hYmxlKGN0cmwtPmhjbGspOworCisJaWYgKGNsa19wcmVwYXJlX2VuYWJsZShj
dHJsLT5oY2xrKSkKKwkJcmV0dXJuIElSUV9OT05FOwogCiAJY3RybC0+cmVnX3JlYWQoY3RybCwg
Y3RybC0+cmVnX2xheW91dFtTV1JNX1JFR19JTlRFUlJVUFRfU1RBVFVTXSwKIAkJICAgICAgICZp
bnRyX3N0cyk7CkBAIC0xNjc1LDcgKzE2NzcsMTEgQEAgc3RhdGljIGludCBxY29tX3N3cm1fcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZ290byBlcnJfaW5pdDsKIAl9CiAK
LQljbGtfcHJlcGFyZV9lbmFibGUoY3RybC0+aGNsayk7CisJcmV0ID0gY2xrX3ByZXBhcmVfZW5h
YmxlKGN0cmwtPmhjbGspOworCWlmIChyZXQpIHsKKwkJZGV2X2VycihkZXYsICJ1bmFibGUgdG8g
ZW5hYmxlIGlmYWNlIGNsb2NrXG4iKTsKKwkJZ290byBlcnJfaW5pdDsKKwl9CiAKIAljdHJsLT5k
ZXYgPSBkZXY7CiAJZGV2X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIGN0cmwpOwpAQCAtMTgwMCw3
ICsxODA2LDEwIEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3dybV9ydW50aW1lX3Jlc3Vt
ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCQlkaXNhYmxlX2lycV9ub3N5bmMoY3RybC0+d2FrZV9p
cnEpOwogCX0KIAotCWNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5oY2xrKTsKKwlyZXQgPSBjbGtf
cHJlcGFyZV9lbmFibGUoY3RybC0+aGNsayk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKwog
CWVuYWJsZV9pcnEoY3RybC0+aXJxKTsKIAogCWlmIChjdHJsLT5jbG9ja19zdG9wX25vdF9zdXBw
b3J0ZWQpIHsKLS0gCjIuNTUuMAoK
