Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795038136;
	b=u0iV9hz6bcb0IdwhmH4JPJDctmHkAhciwzqyg4YB4TazMUXzlp61V0naJ67QnQaX09o1
	 WzJv1fUtY227E7bwUcp65wKrl23n0PHNCM5PVOJESkHaHCawkfV9sCewBzATfBWYwB8s8
	 WV1hg4/34z77cnS6HERVlpx5SxdSFUS5J6YNkU8X/4uO20rDFd9PqulwyFG1xw+o2W3rh
	 AHuPc4UnFTEwmO2gTsiQ5D+FGsf+tJ2g0LUrlokIktqSARwCZW+OgBnoGi8On2ZxjbIPU
	 2kD2f3EccL3Ku+NOaNbbmTPFWzBo1w+3P9c1f1sWyPKbK7SlG2oJkrCz68nxXX9ODUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=PZgo81B8EGyu5VfS6QLYCOE/jAo1hC2voCDqRZt9O28=;
	b=0CzNVBgxrK1Ptb3EejEdOV3QkGk5Od7jqjSVnqJC/KlRZwGVybrTeZ7hCdCQww406stS
	 kd9Gdh4C/h4dBDPiCYdwTx/EfkUxg3DGEGLhCBuoIm763f3wMJXCdaeh6tugihsS26zlW
	 EVvf6dctwogsW6dc8U9SfKqoCXu77N5UFcaYB1fLnI4X1o222dp1DinH0LfG7O4mlOQjM
	 A01r/8YUOPl92w2km6KdEQ1rg9pBvfGlqqDcDnAoADznBTlthb4nO4cAM9behmh70ROw2
	 UmzGNzINnckglNweUhlgTAdsafRXPmr1SIQ6Hnea/cMQ0OnDgo1Nm8mR/Mx7LESoaOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0TPOHJ37;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0F8606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C0F8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0TPOHJ37
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91eb46044c4so18004156d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:42:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795038135; cv=none;
        d=google.com; s=arc-20260327;
        b=kgEW5oP+gSfDRN1xynd0AL2A1NpoWRrf85UC66sxpFT5zKEyyaUNuQnalQWaAXjB0K
         Rm+PE2J7KAxtujkohQAWxCDKIcQQZtOlVOihDH9EKOZPR6ViupOocS0w3saHELBHHFnO
         B/6+lvnu9IrBTOAom1vIyhROovVNa8QSww1r+KLC9Rq5rgEguQqjPcqwtDQ1wsql4UvC
         Y8Wa/7UHjrGtMqFflBf4oXbM1DrDtrf8ChaRWnsHQhuUD0Fsejwi+tkTcIRruPcgxgH0
         X+REw20Ng2n9dLWUyhUmgDiMJDmUV3iFhgX5bqTS9LlDXuEpLiNjJiTrsOVfbbAYHU0t
         fIeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=PZgo81B8EGyu5VfS6QLYCOE/jAo1hC2voCDqRZt9O28=;
        fh=N1kjHhQhrXhp5YMcnKd9TGbZChv9prz5uiPLJofhIas=;
        b=k1840wKroyB+z0WlZIF12IeQJTAlgEE/E5fyG7mdjVGcl88HsIyaL0/h1Qz6XsFbeI
         AECGRXNXaN3djr7xLEzE0YnYOJ2nO1rhRL3KThcEeXjU9B1gQCC6FUqZYcJiUJBW85Wh
         4CWK7QKnFIO2OBhZhl9RtzOnYqN/dltD/MfjjLkhh/y1E+Mxdw9Z/LFTrjS9RqC4NQkn
         FyHRy8iQGHGhboJlp0KUYk7baKeA8Vl6d8y4q5uvnd1xOTPu6tc5KBQF1bYJGCfcRx6a
         HjIcFAVfcp4mu6+ZJAf4PYujtSYOoJ8n0uH5E9WAT08GIJtKJblf7U+ZPLfGJePhuVtB
         8mVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795038135; x=1795642935; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZgo81B8EGyu5VfS6QLYCOE/jAo1hC2voCDqRZt9O28=;
        b=0TPOHJ37XvJrDGvKELG6mnYb7+AcidW6HDT78Dx02U4yS3hPOLZxgnODdBbqL3nh4m
         SW28bUjN9Or3laH5JXQoNN9Naps3HsSAMXl6qGRDzdq69L113+3L25OKdAauS7mfad2X
         kzrjROz38OmMqmbTYlNEe8iKnGz7GPqmB/9YnE6PAHBCijAFjhfUUKCIbp0HyzPh702h
         E3sqA4bALgV9jiUe/NqbJ3I0yDLaRz+lskPBe4PxLEyhW6dVZ1Djc1sdkSLco74tOvQt
         POYAFuKuX1MCV3k92oePrGh4QSVlS5qFDIH3I55+RwCL8167HdJHg4TdPkD8aKHTZcss
         dJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795038135; x=1795642935;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PZgo81B8EGyu5VfS6QLYCOE/jAo1hC2voCDqRZt9O28=;
        b=NhgnUhtuTgMRLEN8pxKWLjhQd5ihB+XwT3r2RkjG06qOt4nkFM/FxYiTJCQcz8ABTe
         2QzAKOZff/QONA+YEOOroR/oFdZosDT7UshGlgJowNWI4c7uRIPXN7RM0XoKnVacJHqQ
         yhtz8Rfesj3AgB0BVKrxCYBdvN9QG3oxKQjygYwKPEAypeno2VdE/qxbJ+bU+L/7C7Hv
         GrerOWK8esoED49R9kXgKY+Sm0APSdvSzTF8Vey2Cl3/dcXPeUCnvYrdmyAaB0DHNwZk
         boETjYTZrpu6MyJtof1dxYmH/0XlucksxnbA6EyPgmlIGGG3Ah/QSGjyocSuE6w4OmtS
         T7Jg==
X-Forwarded-Encrypted: i=1; AL+hErHaX48UEmSEh/fVmcKtiPI6WmORxr1S/7vAxrNwqZ6oPupIReg8ZmnB6uzR4uTMfJ6Tm6cYXXb9d6VQlHc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8otjfUCtxuqxGeKlfomDYk5P4Ym+E8ExsuLFEvQnfy4J6LbCpQ
	BfRnubYwNFWxaX7O5CC/u3aSXhPeXP8wu4FbROKa3By2U8a25fwPpSu7nonYH9Ho7Tyn9n8/bAN
	YjxJinW4S7M92nQE8sPVTUcmq7h9kQJw=
X-Gm-Gg: AZFdTZcW5PvXvyHPTV2aNxxkj/6rjR02pITR7TEfGs4b7mUIyBrBDc+xUN0UC++c+b3
	X0AQZk4YpNtDPs5jWHuPV8t9p0py+DLiWqjtDoP46JDmqAuLxPYvLLuOtiFbu3GcPvfbSRny9Mc
	uerRQVIvhw5GjXf9HZ3KlDkRzI9VCGqqYL/LF5Vay5ZcsckcMoT38HIy/19jL4kyhPYJe3E1mNL
	m0aQspqGUIe0qxlhDtHsjh/R3fcX6yy+Yubn0+ewx/2hcjDPTw8Z3olLN9UaNghJ261w6wx+Ipe
	a39IAgsOkpV51btWmjk3Yfjuwu5LlJuVjMdObCzgce+DiN5KFcUyf+iyipwMQRq0X56zOjE71c5
	M69S1iy/DBAfhP1BcQVWErVq6/PLDT0rnk5taabNg4xe4KeTL2O8rim6mMJlIyBRQG16yrQ==
X-Received: by 2002:a05:6214:2262:b0:91e:a540:e60f with SMTP id
 6a1803df08f44-92114f00647mr64339846d6.21.1795038134975; Wed, 18 Nov 2026
 13:42:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Mohammed <mohammed.saad.alquraini@gmail.com>
Date: Thu, 19 Nov 2026 00:42:03 +0300
X-Gm-Features: Aa3M54pvmImI4VqiA8qenh-mRCIzcgE05rspDsxx4DTFedD1DGFdUeykOQkAgi8
Message-ID: <CAD37_9i7A+M9159MoSw8rjAzkGVOagZmgkPrxJsAtQH_7NjGJg@mail.gmail.com>
Subject: [Security] Bluetooth: L2CAP: deferred BR/EDR accept bypasses the
 required BT_SECURITY level
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Marcel Holtmann <marcel@holtmann.org>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm reporting a vulnerability in the Linux kernel Bluetooth L2CAP layer
(net/bluetooth, deferred connection setup). A fix is posted separately as the
patch "[PATCH] Bluetooth: L2CAP: check security before completing a deferred
BR/EDR accept".

Affected: present in torvalds/linux 666539eecdf4 and unchanged at
mainline master
as of 2026-11-19 (no net/bluetooth change since then touches
__l2cap_connect_rsp_defer
or the deferred completion path). Reachable in a default
configuration: BlueZ's own
BR/EDR profile servers listen this way through its standard
bt_io_listen() API, so no
bespoke daemon is required (details below).

Summary
----------------
A BR/EDR L2CAP service that listens with BT_DEFER_SETUP asks the
kernel to enforce
its BT_SECURITY level and only decides which peer to admit. The deferred-accept
completion path does not honour that. The child channel is pollable before link
security resolves, so when userspace accepts and recvmsg()s it in that window,
l2cap_sock_defer() replies CONN_RSP result=SUCCESS with no security
check. If the
security procedure then fails, l2cap_security_cfm() has no branch that matches a
failed result on the now-completed channel, so nothing tears it down:
a peer that
failed the service's required security level keeps a connected,
data-passing channel.
No MITM-protected pairing is required; an auth failure is enough.

Details
-----------
1. The child channel is enqueued on the parent's accept queue at
CONN_REQ time, and
   bt_accept_poll() (net/bluetooth/af_bluetooth.c) reports it pollable
while it is
   still in BT_CONNECT2, specifically when the parent has BT_SK_DEFER_SETUP:

        if (state == BT_CONNECTED ||
            (test_bit(BT_SK_DEFER_SETUP, &bt->flags) &&
             state == BT_CONNECT2)) {
                mask = EPOLLIN | EPOLLRDNORM;

   A poll-driven server therefore takes the connection while the link security
   procedure is still pending.

2. l2cap_sock_defer() (net/bluetooth/l2cap_sock.c), reached from
recvmsg() on the
   deferred child, completes the BR/EDR setup with no security consult:

                } else {   /* BR/EDR basic / ERTM */
                        sk->sk_state = BT_CONFIG;
                        chan->state = BT_CONFIG;
                        release_sock(sk);
                        __l2cap_connect_rsp_defer(chan);
                }

   __l2cap_connect_rsp_defer() then hardcodes rsp.result = L2CAP_CR_SUCCESS. The
   sibling setsockopt(BT_SECURITY) path in the same file *does* re-check, via
   l2cap_chan_check_security(); the non-deferred incoming path denies with
   L2CAP_CR_SEC_BLOCK. Only this deferred BR/EDR path is missing the check.

3. On an auth failure, l2cap_security_cfm()
(net/bluetooth/l2cap_core.c) only denies
   a channel still in BT_CONNECT2:

        } else if (chan->state == BT_CONNECT2 && !(... FLOWCTL)) {
                ...
                } else {
                        l2cap_state_change(chan, BT_DISCONN);
                        ... res = L2CAP_CR_SEC_BLOCK;

   The early accept in step 2 already moved the channel to BT_CONFIG,
so neither this
   failure branch nor the !status success branch matches it: the
failed result is
   silently dropped and the channel stays connected.

This is the BR/EDR counterpart of CVE-2025-39889 ("Bluetooth: l2cap:
Check encryption
key size on incoming connection", commit 522e9ed157e3), which added a
SEC_BLOCK gate
for the same class of problem at the non-deferred incoming site; the
kernel CNA rated
that one High (CVSS 8.1). The deferred site was not covered. The LE
connection-oriented deferred path is being given equivalent handling separately
(Kyle Pepper's "Keep credits from completing security upgrades"
series); this report
is the BR/EDR basic/ERTM piece that series does not touch.

Default-configuration reachability: BlueZ's bt_io_listen() enables
BT_DEFER_SETUP
whenever a confirm callback is supplied (btio/btio.c), and BR/EDR
profile servers
listen that way with a security level -- e.g. the HID interrupt channel,
profiles/input/server.c: bt_io_listen(NULL, confirm_event_cb, ...,
BT_IO_OPT_SEC_LEVEL,
...) on L2CAP_PSM_HIDP_INTR (A2DP/AVDTP, AVRCP and BNEP use the same
pattern). On an
incoming connection BlueZ runs the profile's confirm callback and
bt_io_accept() does
the completing read() while security is still pending. The kernel
inherits both the
defer flag and the security level onto the child (l2cap_sock_init).

Reproduction
------------------
On an unmodified build of commit 666539eecdf4 (CONFIG_BT=y, BT_BREDR=y, BT_LE=y,
BT_HCIVHCI=y, debugfs on), driven over /dev/vhci in a QEMU arm64 guest. A local
service listens with setsockopt(BT_SECURITY, HIGH) +
setsockopt(BT_DEFER_SETUP, 1) and
poll-accepts; the harness is both the controller and a BR/EDR peer that holds
Authentication_Complete:

- The service accepts during the pending window: the kernel sends CONN_RSP
  result=PEND, the service accepts and recvmsg()s, and the kernel then
sends CONN_RSP
  result=SUCCESS with the link still unauthenticated (the service
reads security level
  0 on its own socket).
- The peer's Authentication_Complete is then delivered as a genuine failure
  (status=6); the kernel emits MGMT_EV_AUTH_FAILED but sends no
Disconnection Request
  and no CONN_RSP SEC_BLOCK. The channel stays BT_CONNECTED and keeps delivering
  attacker data; the only teardown in the trace is the service process
being killed.
- Boundary control: the identical attacker against a listener
*without* BT_DEFER_SETUP
  is refused with CONN_RSP result=3 (SEC_BLOCK) at the auth failure and receives
  nothing. The deferred path is the hole.

A self-contained reproducer (fake controller plus attacker) is
available on request.

Impact
------------
A remote BR/EDR peer in range, via a connection whose security the
kernel was asked to
enforce and which fails, ends up with a connected, data-delivering
L2CAP channel to a
service that required the kernel to deny it. In a default install that
service is a
bluetoothd profile server. The authorization decision the service
delegated to the
kernel is never applied. Access that the admitted channel may
subsequently reach at
the application layer was not exercised and is not claimed.

Severity: CVSS:3.1/AV:A/AC:L/PR:N/UI:N/S:U/C:L/I:H/A:N = 7.1 (High).
I:H because the
security level the service required is bypassed and never enforced. C:L for the
attacker->service data flow shown (service->attacker confidentiality was not
demonstrated); A:N. UI:N because the kernel completes and keeps the
channel with no
user interaction, and the failing peer never needs a pairing prompt.
This matches the
kernel's own High (8.1) rating of the non-deferred sibling CVE-2025-39889.

Fix
------------
A suggested fix is posted separately (the patch named above); the
final form is of
course yours to decide. It gates the deferred completion on the
security state, in
two small parts:

- l2cap_sock_defer(): before completing a BR/EDR deferred accept, call
  l2cap_chan_check_security() -- the same check the
setsockopt(BT_SECURITY) sibling
  runs. If the level is not yet met, mark the socket BT_SK_ACCEPTED,
leave the channel
  in BT_CONNECT2 and send nothing. The existing BT_CONNECT2 failure
branch then denies
  with SEC_BLOCK on failure.
- l2cap_security_cfm(): on success, a channel the daemon already accepted
  (BT_SK_ACCEPTED, read before the branch) is completed through the same path a
  non-deferred accept takes (state -> BT_CONFIG, CONN_RSP SUCCESS +
CONF_REQ) instead
  of re-signalling an accept already made, so exactly one CONN_RSP is
sent per channel
  and the on-air sequence stays strictly monotonic.

Tested on the affected commit over the QEMU/vhci rig: before the patch, the
early-accepted channel survives a genuine auth failure and delivers
data; after it,
that case is answered with CONN_RSP SEC_BLOCK and no data flows,
identical to the
non-deferred control, while an early accept followed by a successful
auth completes
with exactly one CONN_RSP SUCCESS only after the security chain resolves, and a
deferred listener that accepts only after security resolves completes
via the designed
CR_PEND -> recvmsg -> SUCCESS path with the link at the required level. The test
kernel was built without lockdep; a PROVE_LOCKING run before applying
is worth doing,
though the added l2cap_chan_check_security() call takes no lock that
l2cap_security_cfm() does not already hold.

Credit
-------------
Mohammed Alquraini, HUMAIN. Found with an AI tool (an LLM-based code analysis
pipeline) and validated by hand with the reproduction above.

Thanks!
