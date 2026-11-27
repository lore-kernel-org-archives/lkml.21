Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788902;
	b=cJcIpbQBElxCUTa5M+VBTLR0/9l8ZxSVG56lMYZVZ2eMkEqgp/uXxPN6TBqF7NxC1y0z
	 ADSgkarAbKe3nY7ivKnXX524UkdRAFaEbeEeHNIMMDMf7XA2YOHa67brh+1s14LFCjOz4
	 gyzvC/0dRHUwOVlYiTZCsxckePPEllmZ2U6WiGp6aCbbeSdExMBbeD1GDK305b6E9eTV+
	 H0+hcjBCyn/CrjD8/8UUqqhHihVdzhyKAOd29+Kthjp7ALF1/cqlUUnvQCf6OGeQkCo2T
	 6PO5pg1x3TPaER9ROYNxYspQU3Dgxrhs6MFC4TXapC38ilo0qThyTVg5DRhVx5QIsCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tDdaCTthvXHeuh3SlKk3LyJm8mRRdJRXWaUBt0EGmFM=;
	b=bXzwi/qFw0GHMb38yd/c7r+IzizGRVQOI/N/pKD3BHoWGWCeMA310YQo+jfKimxbNyJb
	 f/p4lP8b5IdCaojiYZiM7iS/E0y8z8rYFy4O1HJg7vPZJl0uY5Bqdqe+S2l4h4u1CWJ5H
	 qJoAshA/uOvqwWFVwrtGE9ypjin29zow4LWJTGocOnHq+ag5fZTbBExaep1NK03zHl+Mi
	 DE+gtcLxtpMW88O5jm3dMJkUSNAnMV7YXCEYGgxruAMXEF2gwOFs9KX8jMrClUa4oJKRT
	 g1fog+2kZ95cAHDakyQ3w0FXySkxC5woHYr+NsG1/HNot17Xr4sGnwRmxi8kb1Q1IMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JDkaTPyB;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B539606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B539606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JDkaTPyB
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2f06c2c371aso22008365ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795788901; x=1796393701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDdaCTthvXHeuh3SlKk3LyJm8mRRdJRXWaUBt0EGmFM=;
        b=JDkaTPyBh98aANjDrMm84f+Uv3zrS3Y6ktOJnpxjt94sR00Bla9t4v9CkxdcgvgsRI
         GHDejxBdo89sIRODT6HDNrtJ1tKrnrfHxd/LxjRrrLSmUP5pFTsAxhkDvh7TN1ZBe1yw
         svuO6PZu04VHQSn6xriM8RwQp2kr7M7DfrEf0drB6ucyt+JrQvQd7pRvYE6Qn8l8JL/E
         wfinoxEPqGFXts0keeEvu7ohQAxQYRxOHJgq2tsFGFLMkVZMLTtdieP1/qT5VL0vkrDk
         2OCh+NH7Fws/0YqsHaOkivfm7nUswKxe2LAvRp1Ltkf49+Ncl71+0uUsb2tlM4d5pVXJ
         rpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795788901; x=1796393701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDdaCTthvXHeuh3SlKk3LyJm8mRRdJRXWaUBt0EGmFM=;
        b=FAEpTULIFtApQy1Nov67b+N3pL8e+c5EZnpwd1rbAYpvqiLB1tPD4LwJOMf3saWphO
         CJCRcSNiuN8Ul/bgPlYk07P0i0MwoGfHHe4ZjpwQ0J/EGOiab9U7d8nWKDqxUYJkeLEP
         Ay5IjExflGBkV2fn3Yd/qbnpO4J/VoPefvQgJp9h1cg9HJh3DrBl8QT7AgwzZpAM+/2r
         d5ZlcAXsnZZICWoDhk+E2oEvMfwZMBtmVjIQW8e4UxWqaOhqV0l2aYucumDu26rJj74l
         DDJ/685cQmCkf8gm/xjg6F4tOz9YFXA40QFbmj1OafoTDupbwY0TcyBaC3l/BJ9NuX6n
         xB/Q==
X-Forwarded-Encrypted: i=1; AL+hErFkwMemeHH2Dlm+D/Sw5WeoIZbo0UmQ7Q818wynJ7Vb9z9lTP/KsY4Qj2cMXT5E2U6+7GZIHG/ZG022Nus=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MTN0cwnld5krSnPTDWb6UDUcM7Mj/N+uWy3v9PkcLshm2ut0i
	h/KJT0mCy0DzOGVf28I+KmP5g1VIdpLFT5jxZBIznQvYbiyotDTrQCwr
X-Gm-Gg: AZFdTZd3Y4mUUxz+RmvflJaEtar4HONCCKPFXDlXBdBgCdFqNdYgzIGkSVNjbUNVZNv
	frs1e3yHd2KZFqwDL28bOY1So8bMb+SMmeq/a4pfRuVBTorGFQ+QgBtJ6QaZ7eOqbmRCcVacbFP
	Fi/bdP4Sl/KpIzzU9WQoiun32yaoS+8GdrcQdF25f4ijLcfKUofWx/moC6mJSnIs2SqMh5LFSB1
	f5Q2i3W1HVPLNYIvyuKBOAD1D1c067XVOUQxfDbd9DPvWkf5zJHIZ3oROPnmS2+nTT53B+JIFDv
	rNIaakUbY7GNHQIpFOXneEDK/iH418+3EgrtALvH6WQSKw61zveToOBbVM6Ecsr53K+u+XDMPdF
	gc14W42+D2awnZdo42uVZL+5Kp3f7hFNOzcLSli2bvL3IZhOsd7C+jcxLvqKBxxWJmsH4e3pfdu
	wPTLqoJto39QBZ1awrMIM2yC9X5oJB04z+9OUXYH23ebCR+LZ+r5A8OGIOmiYjQ7TGwyKXBXMaR
	BeIV/RPtZHJH2zFqQ8S+LAuc29jkwNYsx3avf8oSY9ATAcP9tV/ngt1zjDMiK6KUr02Lq+FufmJ
	CPlpnXCicg+8M9/UV8Hmlkcih+KylVtSP0nBjl6tYR/KRZcnqpwE/6x+swhiyoAwhGt8ryA+CbB
	Q/w==
X-Received: by 2002:a17:90b:134e:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3b41c7b5dbfmr23550032a91.9.1795788900519;
        Fri, 27 Nov 2026 06:15:00 -0800 (PST)
Received: from jiayi-vm-sprl-server17.local ([155.69.195.24])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0332bfsm13200058a12.22.2026.11.27.06.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:15:00 -0800 (PST)
From: Jiayi Zhang <zhangjiayi1014@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Farhad Alemi <farhad.alemi@berkeley.edu>,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	syzbot+e6bea924b5ee24f7cb98@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] greybus: svc_watchdog: initialize reset_work only once
Date: Fri, 27 Nov 2026 14:14:42 +0000
Message-ID: <20261127141442.4158862-1-zhangjiayi1014@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026112758-rosy-elastic-d3d7@gregkh>
References: <2026112758-rosy-elastic-d3d7@gregkh>
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

On Fri, Nov 27, 2026 at 09:01:56AM +0100, Greg Kroah-Hartman wrote:
> Cool, how are you running this?  What fake devices do you have where you
> have two svc hosts?

When I sent the patch I was not running it: syzbot has no reproducer for
this report, and the analysis was from the source and the syzbot console
logs. The two hosts in those logs are emulated USB devices. syzkaller
connects them through raw-gadget and dummy_hcd with the ID of the ES2
bridge, and es2_ap_driver binds to each of them:

  usb 5-1: New USB device found, idVendor=18d1, idProduct=1eaf, bcdDevice= 0.00
  usb 9-1: New USB device found, idVendor=18d1, idProduct=1eaf, bcdDevice= 0.00

Since then I wrote a small program that does the same on purpose, and
tested the patch with it. It is below. It emulates two ES2 bridges with
raw-gadget on two dummy_hcd instances (dummy_hcd.num=2). Each device
answers the enumeration, the CPort count request and the ARPC requests,
sends the SVC protocol version and hello requests, and then never answers
the watchdog ping. Both pings time out and both watchdogs schedule
reset_work.

Tested in QEMU on mainline (9437ee8b6cf6), x86_64 defconfig and
kvm_guest.config plus GREYBUS_ES2, USB_DUMMY_HCD, USB_RAW_GADGET and
DEBUG_OBJECTS_TIMERS, with the two hello requests 100 ms apart
("es2_two_hosts 2 100"). With one device there is no warning.

- without the patch, 3 of 3 runs:

  greybus 2-svc: Resetting the greybus network, watch out!!!
  greybus 1-svc: Resetting the greybus network, watch out!!!
  ODEBUG: init active (active state 0) object: 00000000a2d4af25 object type: timer_list hint: greybus_reset+0x0/0x40
  WARNING: lib/debugobjects.c:629 at debug_print_object+0x60/0xa0, CPU#0: kworker/0:1/12
  Workqueue: events do_work

- with the patch, 3 of 3 runs: no warning, and greybus_reset() runs once,
  half a second after the first ping failure:

  greybus 1-svc: Resetting the greybus network, watch out!!!
  greybus 2-svc: Resetting the greybus network, watch out!!!
  svc_watchdog: calling "/system/bin/start unipro_reset" to reset greybus network!

Thanks,
Jiayi

---
es2_two_hosts.c, build with "gcc -static -O2 -o es2_two_hosts es2_two_hosts.c -lpthread":

// SPDX-License-Identifier: GPL-2.0
/*
 * Emulate several Greybus ES2 bridges (USB 18d1:1eaf) with raw-gadget on
 * dummy_hcd, so that es2_ap_driver registers one greybus host device and one
 * SVC per emulated device.
 *
 * Each emulated device answers the USB enumeration, the CPort count request
 * and the ARPC requests of the driver, then sends the two SVC requests that
 * bring up the SVC connection (protocol version and hello). It never answers
 * the SVC ping of the watchdog, so the ping of every SVC times out, and all
 * watchdogs schedule the file-scope reset_work within a short time of each
 * other.
 *
 * Needs CONFIG_GREYBUS_ES2, CONFIG_USB_DUMMY_HCD, CONFIG_USB_RAW_GADGET and
 * dummy_hcd.num=<devices> on the kernel command line.
 *
 *   es2_two_hosts [devices (2)] [delay between the hellos in ms (0)] [seconds to run (12)]
 */
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <linux/usb/ch9.h>
#include <linux/usb/raw_gadget.h>

#define GB_APB_REQUEST_CPORT_COUNT	0x04
#define GB_APB_REQUEST_ARPC_RUN		0x12
#define GB_SVC_TYPE_PROTOCOL_VERSION	0x01
#define GB_SVC_TYPE_SVC_HELLO		0x02

#define EP_CPORT_IN	0x81	/* first bulk IN: CPort messages to the host */
#define EP_CPORT_OUT	0x02	/* bulk OUT: CPort messages from the host */
#define EP_ARPC_IN	0x86	/* second bulk IN: ARPC responses */

struct io {
	struct usb_raw_ep_io inner;
	uint8_t data[4096];
};

struct event {
	struct usb_raw_event inner;
	struct usb_ctrlrequest ctrl;
};

struct dev {
	int id, fd;
	int ep_in, ep_out, ep_arpc;
	pthread_t ep0, svc, out;
};

static int ndev = 2, delay_ms, run_s = 12;
static pthread_barrier_t hello_barrier;
static struct timespec t0;

static void say(struct dev *d, const char *fmt, ...)
{
	struct timespec t;
	char buf[256];
	va_list ap;

	va_start(ap, fmt);
	vsnprintf(buf, sizeof(buf), fmt, ap);
	va_end(ap);
	clock_gettime(CLOCK_MONOTONIC, &t);
	printf("[%7.3f] dev%d: %s\n", (t.tv_sec - t0.tv_sec) + (t.tv_nsec - t0.tv_nsec) / 1e9, d->id, buf);
	fflush(stdout);
}

static void die(struct dev *d, const char *what)
{
	say(d, "%s: %s", what, strerror(errno));
	exit(1);
}

static const struct usb_device_descriptor dev_desc = {
	.bLength = USB_DT_DEVICE_SIZE,
	.bDescriptorType = USB_DT_DEVICE,
	.bcdUSB = 0x0200,
	.bMaxPacketSize0 = 64,
	.idVendor = 0x18d1,
	.idProduct = 0x1eaf,
	.bNumConfigurations = 1,
};

#define EP_DESC(addr) { \
	.bLength = USB_DT_ENDPOINT_SIZE, .bDescriptorType = USB_DT_ENDPOINT, \
	.bEndpointAddress = (addr), .bmAttributes = USB_ENDPOINT_XFER_BULK, .wMaxPacketSize = 512 }

static const struct usb_endpoint_descriptor ep_cport_in = EP_DESC(EP_CPORT_IN);
static const struct usb_endpoint_descriptor ep_cport_out = EP_DESC(EP_CPORT_OUT);
static const struct usb_endpoint_descriptor ep_arpc_in = EP_DESC(EP_ARPC_IN);

static int config_desc(uint8_t *p)
{
	struct usb_config_descriptor c = {
		.bLength = USB_DT_CONFIG_SIZE,
		.bDescriptorType = USB_DT_CONFIG,
		.wTotalLength = USB_DT_CONFIG_SIZE + USB_DT_INTERFACE_SIZE + 3 * USB_DT_ENDPOINT_SIZE,
		.bNumInterfaces = 1,
		.bConfigurationValue = 1,
		.bmAttributes = USB_CONFIG_ATT_ONE | USB_CONFIG_ATT_SELFPOWER,
		.bMaxPower = 50,
	};
	struct usb_interface_descriptor i = {
		.bLength = USB_DT_INTERFACE_SIZE,
		.bDescriptorType = USB_DT_INTERFACE,
		.bNumEndpoints = 3,
		.bInterfaceClass = USB_CLASS_VENDOR_SPEC,
	};
	uint8_t *q = p;

	memcpy(q, &c, c.bLength); q += c.bLength;
	memcpy(q, &i, i.bLength); q += i.bLength;
	memcpy(q, &ep_cport_in, USB_DT_ENDPOINT_SIZE); q += USB_DT_ENDPOINT_SIZE;
	memcpy(q, &ep_arpc_in, USB_DT_ENDPOINT_SIZE); q += USB_DT_ENDPOINT_SIZE;
	memcpy(q, &ep_cport_out, USB_DT_ENDPOINT_SIZE); q += USB_DT_ENDPOINT_SIZE;
	return q - p;
}

/* A greybus message for CPort 0 (the SVC CPort): 8 byte header and payload. */
static void cport_write(struct dev *d, uint16_t id, uint8_t type, const void *payload, int len)
{
	struct io io = { .inner = { .ep = d->ep_in, .length = 8 + len } };

	io.data[0] = 8 + len;
	io.data[2] = id & 0xff;
	io.data[3] = id >> 8;
	io.data[4] = type;
	memcpy(io.data + 8, payload, len);
	if (ioctl(d->fd, USB_RAW_IOCTL_EP_WRITE, &io) < 0)
		die(d, "write to the CPort IN endpoint");
}

/* Bring up the SVC connection, then stay silent. */
static void *svc_thread(void *arg)
{
	struct dev *d = arg;
	static const uint8_t version[2] = { 0, 1 };
	static const uint8_t hello[3] = { 1, 0, 1 };	/* endo id 1, AP interface 1 */

	cport_write(d, 1, GB_SVC_TYPE_PROTOCOL_VERSION, version, sizeof(version));
	say(d, "sent SVC protocol version request");
	pthread_barrier_wait(&hello_barrier);
	if (d->id && delay_ms)
		usleep(d->id * delay_ms * 1000);
	cport_write(d, 2, GB_SVC_TYPE_SVC_HELLO, hello, sizeof(hello));
	say(d, "sent SVC hello request");
	return NULL;
}

/* Take what the host sends on the CPort OUT endpoint, print it, answer nothing. */
static void *out_thread(void *arg)
{
	struct dev *d = arg;

	for (;;) {
		struct io io = { .inner = { .ep = d->ep_out, .length = sizeof(io.data) } };
		int n = ioctl(d->fd, USB_RAW_IOCTL_EP_READ, &io);

		if (n < 0) {
			if (errno == EINTR)
				continue;
			die(d, "read from the CPort OUT endpoint");
		}
		if (n >= 8)
			say(d, "host sent: operation id %u, type 0x%02x, %d bytes%s",
			    io.data[2] | io.data[3] << 8, io.data[4], n,
			    io.data[4] == 0x13 ? " (SVC ping, not answered)" : "");
	}
	return NULL;
}

static int ep_enable(struct dev *d, const struct usb_endpoint_descriptor *desc)
{
	int h = ioctl(d->fd, USB_RAW_IOCTL_EP_ENABLE, desc);

	if (h < 0)
		die(d, "enable endpoint");
	return h;
}

static void ep0_write(struct dev *d, const void *data, int len, int wlength)
{
	struct io io = { .inner = { .length = len < wlength ? len : wlength } };

	memcpy(io.data, data, io.inner.length);
	if (ioctl(d->fd, USB_RAW_IOCTL_EP0_WRITE, &io) < 0)
		say(d, "ep0 write: %s", strerror(errno));
}

static int ep0_read(struct dev *d, struct io *io, int wlength)
{
	int n;

	memset(&io->inner, 0, sizeof(io->inner));
	io->inner.length = wlength;
	n = ioctl(d->fd, USB_RAW_IOCTL_EP0_READ, io);
	if (n < 0)
		say(d, "ep0 read: %s", strerror(errno));
	return n;
}

static void control(struct dev *d, const struct usb_ctrlrequest *c)
{
	uint8_t buf[256];
	struct io io;
	int n;

	if ((c->bRequestType & USB_TYPE_MASK) == USB_TYPE_STANDARD) {
		switch (c->bRequest) {
		case USB_REQ_GET_DESCRIPTOR:
			switch (c->wValue >> 8) {
			case USB_DT_DEVICE:
				ep0_write(d, &dev_desc, sizeof(dev_desc), c->wLength);
				return;
			case USB_DT_CONFIG:
				n = config_desc(buf);
				ep0_write(d, buf, n, c->wLength);
				return;
			}
			break;
		case USB_REQ_SET_CONFIGURATION:
			d->ep_in = ep_enable(d, &ep_cport_in);
			d->ep_arpc = ep_enable(d, &ep_arpc_in);
			d->ep_out = ep_enable(d, &ep_cport_out);
			ioctl(d->fd, USB_RAW_IOCTL_VBUS_DRAW, 50);
			ioctl(d->fd, USB_RAW_IOCTL_CONFIGURE, 0);
			ep0_read(d, &io, 0);
			say(d, "configured");
			pthread_create(&d->out, NULL, out_thread, d);
			pthread_create(&d->svc, NULL, svc_thread, d);
			return;
		case USB_REQ_GET_STATUS:
			memset(buf, 0, 2);
			ep0_write(d, buf, 2, c->wLength);
			return;
		}
		ioctl(d->fd, USB_RAW_IOCTL_EP0_STALL, 0);
		return;
	}

	if (c->bRequestType & USB_DIR_IN) {
		memset(buf, 0, sizeof(buf));
		if (c->bRequest == GB_APB_REQUEST_CPORT_COUNT)
			buf[0] = 32;
		ep0_write(d, buf, c->wLength < sizeof(buf) ? c->wLength : sizeof(buf), c->wLength);
		return;
	}

	n = ep0_read(d, &io, c->wLength);
	if (c->bRequest == GB_APB_REQUEST_ARPC_RUN && n >= 5) {
		/* struct arpc_response_message: id of the request, result 0 */
		struct io rsp = { .inner = { .ep = d->ep_arpc, .length = 3 } };

		rsp.data[0] = io.data[0];
		rsp.data[1] = io.data[1];
		if (ioctl(d->fd, USB_RAW_IOCTL_EP_WRITE, &rsp) < 0)
			say(d, "ARPC response: %s", strerror(errno));
		else
			say(d, "answered ARPC request type 0x%02x", io.data[4]);
	}
}

static void *ep0_thread(void *arg)
{
	struct dev *d = arg;
	struct usb_raw_init init = { .speed = USB_SPEED_HIGH };

	d->fd = open("/dev/raw-gadget", O_RDWR);
	if (d->fd < 0)
		die(d, "open /dev/raw-gadget");
	strcpy((char *)init.driver_name, "dummy_udc");
	snprintf((char *)init.device_name, sizeof(init.device_name), "dummy_udc.%d", d->id);
	if (ioctl(d->fd, USB_RAW_IOCTL_INIT, &init) < 0)
		die(d, "USB_RAW_IOCTL_INIT");
	if (ioctl(d->fd, USB_RAW_IOCTL_RUN, 0) < 0)
		die(d, "USB_RAW_IOCTL_RUN");
	for (;;) {
		struct event e = { .inner = { .length = sizeof(e.ctrl) } };

		if (ioctl(d->fd, USB_RAW_IOCTL_EVENT_FETCH, &e) < 0) {
			if (errno == EINTR)
				continue;
			die(d, "USB_RAW_IOCTL_EVENT_FETCH");
		}
		if (e.inner.type == USB_RAW_EVENT_CONTROL)
			control(d, &e.ctrl);
	}
	return NULL;
}

int main(int argc, char **argv)
{
	struct dev *devs;
	int i;

	if (argc > 1)
		ndev = atoi(argv[1]);
	if (argc > 2)
		delay_ms = atoi(argv[2]);
	if (argc > 3)
		run_s = atoi(argv[3]);
	clock_gettime(CLOCK_MONOTONIC, &t0);
	pthread_barrier_init(&hello_barrier, NULL, ndev);
	devs = calloc(ndev, sizeof(*devs));
	for (i = 0; i < ndev; i++) {
		devs[i].id = i;
		pthread_create(&devs[i].ep0, NULL, ep0_thread, &devs[i]);
	}
	sleep(run_s);
	printf("done after %d s, disconnecting\n", run_s);
	return 0;
}
